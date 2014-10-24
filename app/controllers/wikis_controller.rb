class WikisController < ApplicationController
  def index
    @wikis = current_user.wikis
  end

  def create
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
end
