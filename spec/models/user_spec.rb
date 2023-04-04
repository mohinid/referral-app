require "rails_helper"

RSpec.describe User, type: :model do
  describe 'associations' do
    it { is_expected.to have_many(:referrals).dependent(:destroy) }
    it { is_expected.to belong_to(:referred_by).optional(class_name: 'User') }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:email) }
  end
end
