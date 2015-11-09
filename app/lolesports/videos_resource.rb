class VideosResource < Resource

  def url
    'http://api.lolesports.com/api/v2/videos'
  end

  def all
    videos_list
  end

  def videos_list
    response = RestClient.get url
    if json = JSON.parse(response.body)
      json["videos"].map { |video| rehash_video(video) }
    else
      []
    end
  end

  def videos_by_tournament(tournament=nil)
    response = RestClient.get url, params: {tournament: tournament}
    if json = JSON.parse(response.body)
      json["videos"].map { |video| rehash_video(video) }
    else
      []
    end
  end

  def rehash_video(video)
    video
  end

end
