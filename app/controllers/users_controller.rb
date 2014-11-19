class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @profile = current_user
    @my_wikis = Wiki.where user_id:current_user.id
    @headline_text = "#{current_user.name}'s Wikis"
  end

  def update
    if current_user.update_attributes(user_params)
      flash[:notice] = "User information updated"
    else
      flash[:error] = "Invalid user information"
    end
    
    redirect_to edit_user_registration_path
  end

  private

  def user_params
    params.require(:user).permit(:name)
  end

end
