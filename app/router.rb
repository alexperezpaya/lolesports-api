
get '/leagues' do
  content_type :json
  leagues = LeaguesResource.new
  leagues.all.to_json
end

get '/league/:slug' do
  content_type :json
  leagues = LeaguesResource.new
  leagues.league_by_slug(params[:slug]).to_json
end

get '/videos' do
  content_type :json
  videos = VideosResource.new
  videos.all.to_json
end

get '/video/:reference' do
  content_type :json
  videos = VideosResource.new
  videos.videos_by_reference(params[:reference]).to_json
end
