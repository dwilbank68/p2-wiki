class WikisController < ApplicationController

  # before_filter :find_wiki

  def index
    @wikis = current_user.wikis
  end

  def create
    current_user.wikis.create(wiki_params)
    redirect_to wikis_path
  end

  def edit
    @wiki = Wiki.friendly.find(params[:id])
  end

  def show
    @wiki = Wiki.friendly.find(params[:id])
    if request.path != wiki_path(@wiki)
      return redirect_to @wiki, :status => :moved_permanently
    end
  end

  def update

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
  end

  def destroy
    @wiki = Wiki.friendly.find(params[:id])
    @wiki.destroy
    redirect_to wikis_path
  end
  ###########################################################################
  private

  # def find_wiki
  #   @wiki = Wiki.friendly.find(params[:id])
  # end

  def wiki_params
    params.require(:wiki).permit(:name, :body)
  end

end
