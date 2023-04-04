class Referral < ApplicationRecord
  belongs_to :user
  validates :email, uniqueness: true, presence: true
end
