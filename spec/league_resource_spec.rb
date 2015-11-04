describe LeaguesResource do

  before "Builds a League Resource" do
    @leagues_resource = LeaguesResource.new
  end

  it "can fetch leagues" do
    p @leagues_resource.all
  end

end
