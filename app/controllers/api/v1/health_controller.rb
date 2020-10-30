class Api::V1::HealthController < ApplicationController

  def health
    render json: {message: "API OK"}
  end

  def index
    @videos = Video.includes(:user).where(user_id: nil)
    if !params[:term].blank?
      @videos = SearchService.video_search(@videos, params[:term])
    end
    @videos_decorated = Api::V1::VideoDecorator.decorate(Video).videos_decorator(@videos)

    render json: {data: @videos_decorated}, status: :ok
  end

  def show
    # 66a4b22b3c3a7d43ef3396600335c0d9
    @video = Video.includes(:user).where(slug: params[:slug], user_id: nil).first
    @video_decorated = Api::V1::VideoDecorator.decorate(@video).basic_info if @video

    if @video_decorated
      render json: @video_decorated, status: :ok
    else
      render json: {message: "Video not found"}, status: :not_found
    end
  end

end
