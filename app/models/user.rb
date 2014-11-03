class User < ActiveRecord::Base
  has_one :profile
  validates :email, presence: true, uniqueness: true
  validates :password_digest, presence: true

  def is_a_barber_and_profile_is_complete
    barber && profile
  end
end
