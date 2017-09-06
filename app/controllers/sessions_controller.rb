class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(username: params[:session][:username])
    if @user.authenticate(params[:session][:password])
      session[:user_id] = @user.id
      flash[:message] = "#{@user.username} was successfully logged in"
      redirect_to user_path(@user)
    else
      flash[:message] = "Unable to log in"
      render :new
    end
  end
end
