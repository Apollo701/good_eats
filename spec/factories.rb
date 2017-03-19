FactoryGirl.define do
  factory :user do
    email 'vash@thesampede.com'
    password '10doubledollars'
    password_confirmation '10doubledollars'
  end

  factory :invalid_user, class: User do
    email ''
    password '10doubledollars'
    password_confirmation '10doubledollars'
  end
end
