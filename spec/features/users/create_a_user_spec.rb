feature 'Creating a user' do
  scenario 'success' do
    visit new_user_path

    fill_form(:user, attributes_for(:user).slice(*sign_up_attributes))

    click_on submit(:user)

    expect(page).to have_content t('user.create.success')
  end

  scenario 'failure' do
    visit new_user_path

    fill_form(:user, attributes_for(:invalid_user).slice(*sign_up_attributes))

    click_on submit(:user)

    expect(page).to have_content "can't be blank"
  end

  private

  def sign_up_attributes
    [:email, :password, :password_confirmation]
  end
end
