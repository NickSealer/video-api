class Api::V1::VideoDecorator < Draper::Decorator
  delegate_all

  def basic_info
    {
      slug: object.slug,
      name: object.name,
      description: object.description,
      url: object.url,
      user: object.try(:user).try(:slug),
      created_at: object.created_at.strftime("%Y-%m-%d %T")
    }
  end

  def videos_decorator(videos)
    records = []
    videos.each do |video|
      records.push({
        slug: video.slug,
        name: video.name,
        description: video.description,
        url: video.url,
        user: video.try(:user).try(:id),
        created_at: video.created_at.strftime("%Y-%m-%d %T")
      })
    end
    records
  end

end
