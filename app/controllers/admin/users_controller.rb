class Admin::UsersController < Admin::BaseController

  def index
    @users = User.all
  end

  def show
    @admin = current_user
    @user = User.find(params[:id])
  end

end
