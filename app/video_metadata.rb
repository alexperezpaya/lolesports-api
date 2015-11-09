class VideoMetadata
  attr_accessor :video, :metadata

  def initialize(video_id)
    self.video = Yt::Video.new id: video_id
  end

  def video_url
    "http://www.youtube.com/watch?v=#{video.video_id}"
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

  def video_id
    video.video_id
  end

  def as_json
    {
      author: author,
      title: title,
      description: description,
      plays: plays,
      thumbnail: thumbnail,
      duration: duration,
      video_id: video_id
    }
  end

end
