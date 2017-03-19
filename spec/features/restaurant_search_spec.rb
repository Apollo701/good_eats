feature 'Find top restaurants in your area' do
  let(:address) { '1700 Octavia st, san francisco, ca' }

  scenario 'successfully returns the top 10 restaurants' do
    visit root_path

    fill_form(:search, { address: address} )

    click_button('Find food')

    expect(page).to have_content "Your delicious 10 results around #{address}"
  end
end
