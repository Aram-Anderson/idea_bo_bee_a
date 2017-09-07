class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    user = User.new(user_params)
    if user.save
      session[:user_id] = user.id
      flash[:message] = "#{user.username} was successfully logged in"
      redirect_to user_path(user)
    else
      flash[:message] = "Unable to create user"
      render :new
    end
  end

  def destroy
    user = User.find(params[:id])
    user.destroy
    flash[:message] = "#{user.username} deleted"
    redirect_to request.referrer
  end

  private

  def user_params
    params.require(:user).permit(:email, :username, :password)
  end
end
