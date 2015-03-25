class WikisController < ApplicationController
  include ActionView::Helpers::TextHelper #for #truncate in show controller
  before_action :find_wiki, only: [:edit, :show, :update, :destroy, :privatize]
  before_action :authenticate_user!
  respond_to :html, :js


  def index
    @wikis = Wiki.includes(:user).visible
    wiki_count = @wikis.count
    hidden_wiki_count = Wiki.hidden.count
    @headline_text = "All #{wiki_count} Wikis"
    @headline2_text = "(#{wiki_count - hidden_wiki_count} public, #{hidden_wiki_count} private)"
  end

  def create
    current_user.wikis.create(wiki_params)
    redirect_to current_user
  end

  def edit
    authorize @wiki
    session[:last_page] = request.env['HTTP_REFERER'] || wikis_url
    @headline_text = "Edit"
  end

  def show
    if request.path != wiki_path(@wiki)
      return redirect_to @wiki, :status => :moved_permanently
    end
    session[:last_page] = request.env['HTTP_REFERER'] || wikis_url
    collaborator_ids = @wiki.collaborations.pluck(:user_id)
    @collaborators = User.find(collaborator_ids)
    @headline_text = @wiki.name.truncate(15)
  end

  def update
    authorize @wiki

    if @wiki.update!(wiki_params)
      redirect_to @wiki
    else
      flash[:error] = "Error saving updating wiki. Please try again"
      render :edit
    end
  end

  def new
    @filler_text = "This is just a sample. You can play around with your own text right here.

Markdown
-------------

...is really just ordinary text, *plain and simple*. How is it good for you?

- You just **type naturally**, and the result looks good.
- You **don't have to worry** about clicking formatting buttons.
  - Or fiddling with indentation. (Two spaces is all you need.)

To see what else you can do with Markdown (including **tables**, **images**, **numbered lists**, and more) take a look at the [Cheatsheet][1]. And then try it out by typing in this box!

[1]: https://github.com/adam-p/markdown-here/wiki/Markdown-Here-Cheatsheet"
    @headline_text = "New Wiki"
  end

  def destroy
    authorize @wiki
    @wiki.destroy
    redirect_to wikis_path
  end

  def privatize
    @wiki.toggle!(:private)
    # render :nothing => true
  end

  ##############################

  private

  def find_wiki
    @wiki = Wiki.friendly.find(params[:id])
  end

  def wiki_params
    render :edit if params['edit']
    params[:wiki][:name] = params[:wiki][:name].titleize
    params.require(:wiki).permit(:name, :body)
  end

end
