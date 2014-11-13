class CollaborationsController < ApplicationController
#
#   before_action :find_collaborations, only: [:edit, :show, :destroy]
#
  def index
    @users = User.all_except(current_user).order(:name)
  end
#
  def create
    @wiki = Wiki.friendly.find(params[:wiki_id])
    @wiki.collaborations.destroy_all
    params[:user_ids].map { |id| @wiki.collaborations.build(user_id:id).save }
    redirect_to @wiki
  end

  # def edit_multiple
  #   authorize @wiki
  #   session[:last_page] = request.env['HTTP_REFERER'] || wikis_url
  # end
  #
  #
  #
  # def update_multiple
  #
  # end

  # def edit
  #   authorize @wiki
  #   session[:last_page] = request.env['HTTP_REFERER'] || wikis_url
  # end
#
#   def update
#     authorize @wiki
#     if @wiki.update!(wiki_params)
#       redirect_to @wiki
#     else
#       flash[:error] = "Error saving updating wiki. Please try again"
#       render :edit
#     end
#   end
#
#   def new
#     @filler_text = "This is just a sample. You can play around with your own text right here.
#
# Markdown
# -------------
#
# ...is really just ordinary text, *plain and simple*. How is it good for you?
#
# - You just **type naturally**, and the result looks good.
# - You **don't have to worry** about clicking formatting buttons.
#   - Or fiddling with indentation. (Two spaces is all you need.)
#
# To see what else you can do with Markdown (including **tables**, **images**, **numbered lists**, and more) take a look at the [Cheatsheet][1]. And then try it out by typing in this box!
#
# [1]: https://github.com/adam-p/markdown-here/wiki/Markdown-Here-Cheatsheet"
#   end
#
#   def destroy
#     authorize @wiki
#     @wiki.destroy
#     redirect_to wikis_path
#   end
#
#   ##############################
#
#   private
#
#   def find_wiki
#     @wiki = Wiki.friendly.find(params[:id])
#   end
#
#   def wiki_params
#     params.require(:wiki).permit(:name, :body)
#   end
#
end
