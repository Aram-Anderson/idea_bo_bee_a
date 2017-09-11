class Admin::CategoriesController < Admin::BaseController

  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      flash[:message] = "#{@category.name} successfully created"
      redirect_to admin_category_path(@category)
    else
      flash[:message] = "Unable to create category"
      render :new
    end
  end

  def edit
    @category = Category.find(params[:id])
  end

  def update
    @category = Category.find(params[:id])
    if @category.update(category_params)
      flash[:message] = "#{@category.name} successfully updated"
      redirect_to admin_category_path(@category)
    else
      flash[:message] = "Unable to update #{@category.name}. Try again."
      redirect_to edit_admin_category_path(@category)
    end
  end

  def destroy
    @category = Category.find(params[:id])
    if @category.destroy
      flash[:message] = "#{@category.name} successfully deleted."
      redirect_to admin_categories_path
    else
      flash[:message] = "#{@category.name} was not deleted"
      redirect_to admin_categories_path
    end
  end

  private

  def category_params
    params.require(:category).permit(:name, idea_ids: [])
  end
end
