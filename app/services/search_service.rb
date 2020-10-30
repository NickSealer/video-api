class SearchService

  def self.video_search(videos, query)
    videos.where("name ILIKE '%#{query}%'")
    .or(videos.where("description ILIKE '%#{query}%'"))
  end

end
