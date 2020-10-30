class Videos::UpdateVideo

  def initialize(video, params)
    @video = video
    @params = params
  end

  def process
    @video.name = @params[:name]
    @video.description = @params[:description]
    @video.url = @params[:url]

    success = @video.save
    if success
      [true, @video]
    else
      [false, false]
    end
  end

end
