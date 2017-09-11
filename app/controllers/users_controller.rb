class UsersController < BaseController
  before_action :current_user?, except: [:new, :create]

  def show
    @user = User.find_by(id: params[:id])
    if @user.nil?
      redirect_to login_path
    end
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:message] = "#{@user.username} was successfully logged in"
      redirect_to user_path(@user)
    else
      flash[:message] = "Unable to create user"
      render :new
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def upddate
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:message] = "#{@user.username} successfully updated"
      redirect_to user_path(@user)
    else
      flash[:message] = "#{@user.username} not updated. Something went wrong."
      redirect_to user_path(@user)
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
