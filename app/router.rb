
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
