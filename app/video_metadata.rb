class VideoMetadata
  attr_accessor :video, :download_urls

  def initialize(video_id)
    self.video = Yt::Video.new id: video_id
  end

  def author
    video.channel_title
  end

  def title
    video.title
  end

  def description
    video.description.to_s
  end

  def plays
    video.view_count
  end

  def published_at
    video.published_at
  end

  def duration
    video.duration
  end

  def thumbnail
    video.thumbnail_url
  end

end
