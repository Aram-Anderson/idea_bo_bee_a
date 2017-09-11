class Admin::IdeasController < ApplicationController

  def index
    @users = User.all
  end

  def show
    @user = current_user
    @idea = Idea.find(params[:id])
  end
end
