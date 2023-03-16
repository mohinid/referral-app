class AddReferralColumnsToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :referral_code, :string, unique: true, limit: 50
    add_column :users, :referred_by, :integer, unique: true
  end
end
