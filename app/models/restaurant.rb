class Restaurant
  attr_accessor :term, :location
  HIGHEST_RATED = 2
  RADIUS = 2000

  class << self
    def search_client
      new
    end

    delegate :search, to: :search_client
  end

  def search(location, term = '')
    @location = location
    @term = term
    find_shops
  end

  private

  def find_shops
    shops = client.search(location, options.merge(term: term))
    sanitize(shops)
  end

  def client
    Yelp.client
  end

  def options
    {
      sort: HIGHEST_RATED,
      radius_filter: RADIUS
    }
  end

  def sanitize(shops)
    shops.businesses.map(&:name)
  end
end
