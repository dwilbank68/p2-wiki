class CollaborationsController < ApplicationController

  def index
    @wiki = Wiki.find(params[:wiki_id])
    if @wiki.user_id == current_user.id
      @users = User.all_except(current_user).order(:name)
      @wiki = Wiki.find(params[:wiki_id])
    else
      redirect_to current_user, notice: "you can only edit your own wiki"
    end
  end

  def create
    @wiki = Wiki.friendly.find(params[:wiki_id])
    @wiki.collaborations.destroy_all  # so that if user UNCHECKS someone, I don't have to
                                      # make a separate destroy action
    params[:user_ids].map { |id| @wiki.collaborations.create(user_id:id) }
    redirect_to @wiki
  end

end
