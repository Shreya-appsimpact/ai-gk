class VideosController < ApplicationController

  def index 
    if params[:category_id].present?
      @category = Category.find(params[:category_id])
      @videos = @category.videos 
    else
      @videos = Video.all 
    end   
  end

  def show
    @video = Video.find(params[:id])
  end
end
