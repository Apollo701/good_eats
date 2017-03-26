describe Restaurant do
  describe '.search' do
    let(:location) { 'San Francisco' }
    let(:options) { { sort: 2, radius_filter: 100 } }
    let(:term) { 'sushi' }
    let(:businesses) { %w(Octavia Alexanders Nopa)}
    let(:shops) { double(:shops , businesses: businesses) }

    it 'locates restaurants' do
      expect(Yelp.client).to receive(:search)
        .with(location, options.merge(term: term))
        .and_return(shops)
      Restaurant.search(location, term)
    end
  end
end
