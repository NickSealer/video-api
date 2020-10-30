class Videos::CreateVideo

  def initialize(user, params)
    @user = user
    @params = params
  end

  def process
    @video = Video.new
    @video.name = @params[:name]
    @video.description = @params[:description]
    @video.url = @params[:url]
    @video.user = @user

    success = @video.save
    if success
      [true, @video]
    else
      [false, false]
    end
  end

end
