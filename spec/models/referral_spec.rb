require "rails_helper"

RSpec.describe Referral, type: :model do  
  let!(:user) { create(:user) }
  let!(:referral) { create(:referral, user_id: user.id) }

  describe 'associations' do
    it { is_expected.to belong_to(:user) }
  end

  describe 'validations' do
   it { is_expected.to validate_presence_of(:email) }
  end
end
