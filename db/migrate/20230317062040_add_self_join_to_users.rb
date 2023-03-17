class AddSelfJoinToUsers < ActiveRecord::Migration[7.0]
  def change
    add_reference :users, :referred_by, index: true
  end
end
