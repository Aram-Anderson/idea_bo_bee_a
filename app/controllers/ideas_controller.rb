class IdeasController < BaseController
  before_action :current_user?
  before_action @user = :current_user

  def index
    @user
  end

  def show
    @idea = @user.ideas.find_by(id: params[:id])
    if @idea.nil?
      flash[:message] = "You don't have that idea in your ideas"
      redirect_to user_path(current_user)
    end
  end

  def edit
    @images = Image.all
    @idea = Idea.find(params[:id])
  end

  def new
    @idea = Idea.new
    @images = Image.all
    @categories = Category.all
  end

  def create
    @idea = @user.ideas.new(idea_params)
    if @idea.save
      flash[:message] = "#{@idea.title} was created successfully!"
      redirect_to user_idea_path(@idea.user, @idea)
    else
      flash[:message] = "Unable to create idea. Something went wrong"
      redirect_to new_user_idea_path(current_user)
    end
  end

  def update
    @idea = Idea.find(params[:id])
    if @idea.update(idea_params)
      flash[:message] = "#{@idea.title} successfully updated"
      redirect_to user_idea_path(@idea.user, @idea)
    else
      flash[:message] = "#{@idea.title} was not updated. Maybe a field was left blank?"
      redirect_to user_idea_path(@idea.user, @idea)
    end
  end

  def destroy
    @idea = Idea.find(params[:id])
    if @idea.destroy
      flash[:message] = "#{@idea.title} was deleted"
      redirect_to user_ideas_path(@idea.user)
    else
      flash[:message] = "#{@idea.title} was not deleted. Please try again."
      redirect_to request.referrer
    end
  end

  private

  def idea_params
    params.require(:idea).permit(:title, :body, :category_id, image_ids: [])
  end
end
