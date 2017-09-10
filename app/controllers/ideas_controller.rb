class IdeasController < ApplicationController

  def index
    @user = User.find(params[:user_id])
  end

  def show
    @idea = Idea.find(params[:id])
  end

  def edit
    @images = Image.all
    @idea = Idea.find(params[:id])
  end

  def new
    @images = Image.all
    @user = User.find(params[:user_id])
    @idea = Idea.new
  end

  def create
    binding.pry
    @idea = Idea.new(params[:idea])
    if @idea.save
      flash[:message] = "#{@idea.title} was created successfully!"
      redirect_to user_idea_path(@idea.user, @idea)
    else
      @images = Image.all
      flash[:message] = "Unable to create idea. Something went wrong"
      render :new
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
    params.require(:idea).permit(:title, :body, :user_id, image_ids: [])
  end
end
