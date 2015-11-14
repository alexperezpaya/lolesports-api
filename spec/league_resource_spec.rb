describe LeaguesResource do

  before "Builds a League Resource" do
    @leagues_resource = LeaguesResource.new
  end

  it "can fetch leagues" do
    @leagues_resource.all.to_a.class.must_equal Array
  end

  it "can lazy enumerate all leagues" do
    @leagues_resource.all.class.must_equal Enumerator::Lazy
  end

end
