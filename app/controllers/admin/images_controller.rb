class Admin::ImagesController < Admin::BaseController

  def index
    @images = Image.all
  end

  def show
    @image = Image.find(params[:id])
  end

  def new
    @image = Image.new
  end

  def create
    @image = Image.new(image_params)
    if @image.save
      flash[:message] = "Image successfully created"
      redirect_to admin_image_path(@image)
    else
      flash[:message] = "Image not created"
      render :new
    end
  end

  def edit
    @image = Image.find(params[:id])
  end

  def update
    @image = Image.find(params[:id])
    if @image.update(image_params)
      flash[:message] = "Image updated successfully"
      redirect_to admin_image_path(@image)
    else
      flash[:message] = "Image not updated. Something went wrong"
      redirect_to request.referrer
    end
  end

  def destroy
    @image = Image.find(params[:id])
    if @image.destroy
      flash[:message] = "Image successfully deleted"
    else
      flash[:message] = "Image not deleted. Something went wrong"
    end
    redirect_to admin_images_path
  end

  private

  def image_params
    params.require(:image).permit(:url, :name)
  end
end
