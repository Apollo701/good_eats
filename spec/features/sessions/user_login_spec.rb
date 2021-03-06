feature 'User login' do
  let(:user) { create :user }
  scenario 'success' do
    user
    visit login_path

    fill_form(:user, attributes_for(:user).slice(*login_attributes))

    click_button('Login')

    expect(page).to have_content t('user.login.success')
  end

  scenario 'failure' do
    visit login_path

    fill_form(:user, attributes_for(:user).slice(*login_attributes))

    click_button('Login')

    expect(page).to have_content t('user.login.failure')
  end

  private

  def login_attributes
    [:email, :password]
  end
end
