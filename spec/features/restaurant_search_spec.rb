feature 'Find top restaurants in your area' do
  let(:location) { '1700 Octavia st, san francisco, ca' }

  scenario 'successfully returns the top 10 restaurants' do
    visit root_path
    fill_form(:restaurant, { location: location} )

    click_button('Find Restaurants')

    expect(page).to have_content "Your delicious 10 results around #{location}"
  end
end
