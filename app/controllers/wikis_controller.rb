class WikisController < ApplicationController
  def index
    @wikis = current_user.wikis
  end

  def create
    current_user.wikis.create(wiki_params)
  end

  def edit
  end

  def show
    @wiki = Wiki.find(params[:id])
  end

  def new
  end

  def destroy
  end

  private

  def wiki_params
    params.require(:wiki).permit(:name, :body)
  end
# TODO - add :public field here
end
