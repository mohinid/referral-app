class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_secure_token :authentication_token
  before_create :generate_referral_code
  after_create :update_referrals
  belongs_to :referred_by, class_name: 'User', foreign_key: 'referred_by_id', optional: true
  has_many :referrals, dependent: :destroy
  
  private
  
    def generate_referral_code
      self.referral_code = SecureRandom.base58(10)
    end

    def update_referrals
      if Referral.find_by(email: self.email)
        Referral.destroy_by(email: self.email)
      end
    end
end
