class Api::V1::VideosController < ApplicationController
  before_action :authenticate_api_v1_user!
  before_action :set_video, only: [:show, :update, :destroy]

  rescue_from ActiveRecord::RecordNotFound do |error|
    render json: {error: e.message}, status: :not_found
  end

  rescue_from Exception do |error|
    render json: {error: e.message}, status: :internal_error
  end

  def index
    @videos = Video.list(@current_user.id)
    if !params[:term].blank?
      @videos = SearchService.video_search(@videos, params[:term])
    end
    @videos_decorated = Api::V1::VideoDecorator.decorate(Video).videos_decorator(@videos)
    render json: {data: @videos_decorated}
  end

  def show
    if @video.user == @current_user
      @video_decorated = Api::V1::VideoDecorator.decorate(@video).basic_info if @video
      if @video_decorated
        render json: @video_decorated, status: :ok
      else
        render json: {message: "Video not found"}, status: :not_found
      end
    else
      render json: {alert: "Stop!"}, status: :unauthorized
    end
  end

  def create
    created_video, video = Videos::CreateVideo.new(@current_user, params).process
    if created_video
      render json: {success: true, video: video}, status: :ok
    else
      render json: {error: "Error while creating video."}, status: :internal_error
    end
  end

  def update
    if @video.user == @current_user
      updated_video, video = Videos::UpdateVideo.new(@video, params).process
      if updated_video
        render json: {success: true, video: video}, status: :ok
      else
        render json: {error: "Error while updating video."}, status: :internal_error
      end
    else
      render json: {alert: "Stop!"}, status: :unauthorized
    end
  end

  def destroy
    if @video.user == @current_user
      @video.destroy!
      render json: {success: true, video: @video}, status: :ok
    else
      render json: {alert: "Stop!"}, status: :unauthorized
    end
  end

  private
    def set_video
      @video = Video.find_by(slug: params[:slug])
    end

end
