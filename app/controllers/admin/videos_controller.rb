class Admin::VideosController < AdminController
  before_action :set_video, only: [:show, :edit, :update, :destroy]

  def index
    @video = Video.all
    @categories = Category.all
  end

  def show;  end

  def new
    @video = Video.new
  end

  def edit;  end
  
  def create
    @video = Video.new(video_params)
    @video.save
    redirect_to admin_video_path(@video), notice: 'Video was successfully created.' 
  end

  def update
    @video.update(video_params)
    redirect_to admin_video_path(@video), notice: 'Video was successfully updated.' 
  end
   
  def destroy
    @video.destroy
    redirect_to admin_videos_path, notice: 'Video was successfully destroyed.' 
  end

  private
    def set_video
     @video = Video.find(params[:id])
    end

    def video_params
      params.require(:video).permit(:title, :image, :description, :video_url, :category_id)
    end
end
