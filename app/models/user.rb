class User < ApplicationRecord
  acts_as_token_authenticatable

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  before_create :generate_referral_code
  
  private

    def generate_referral_code
      self.referral_code = SecureRandom.base58(10)
    end
end
