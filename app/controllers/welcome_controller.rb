class WelcomeController < ApplicationController
  def index
    render layout: "no-light-bars"
  end
end
