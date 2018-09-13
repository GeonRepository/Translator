class HomeController < ApplicationController
  
  def index
  end
  
  def create
    render plain: params[:translate].inspect
  end
end
