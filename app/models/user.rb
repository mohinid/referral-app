class User < ApplicationRecord
  acts_as_token_authenticatable

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  before_create :generate_referral_code
  after_create :update_referrals
  belongs_to :users, class_name: 'User', foreign_key: 'referred_by', optional: true
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
