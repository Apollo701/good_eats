feature 'Find top restaurants in your area' do
  let(:location) { '1700 Octavia st, san francisco, ca' }
  let(:businesses) do
    [ double(name: 'Octavia'), double(name: 'Alexanders') ]
  end
  let(:shops) { double(:shops , businesses: businesses) }
  let(:business_names) { businesses.map(&:name).join(' ') }

  scenario 'successfully returns the top 10 restaurants' do
    expect(Yelp.client).to receive(:search)
      .and_return(shops)

    visit root_path
    fill_form(:restaurant, { location: location} )

    click_button('Find Restaurants')

    expect(page).to have_content "Your delicious 10 results around #{location}"
    expect(page).to have_content businesses.map(&:name).join(' ')
  end
end
