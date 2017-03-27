describe Restaurant do
  describe '.search' do
    let(:location) { 'San Francisco' }
    let(:highest_rated) { Restaurant::HIGHEST_RATED }
    let(:meters) { Restaurant::RADIUS }
    let(:limit) { Restaurant::LIMIT }
    let(:options) do
      { sort: highest_rated, radius_filter: meters, limit: limit}
    end
    let(:term) { 'sushi' }
    let(:businesses) do
      [ double(name: 'Octavia'), double(name: 'Alexanders') ]
    end
    let(:shops) { double(:shops , businesses: businesses) }

    it 'locates restaurants' do
      expect(Yelp.client).to receive(:search)
        .with(location, options.merge(term: term))
        .and_return(shops)

      Restaurant.search(location, term)
    end
  end
end
