class User < ApplicationRecord
  authenticates_with_sorcery!
  with_options if: :new_user_or_updating_user? do
    validates :password, length: { minimum: 3 },
      confirmation: true
    validates :password_confirmation, presence: true
  end

  validates :email, uniqueness: true, presence: true

  private

  def new_user_or_updating_user?
    new_record? || changes[:crypted_password]
  end
end
