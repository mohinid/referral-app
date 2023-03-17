class RemoveReferredByColumnFromUsers < ActiveRecord::Migration[7.0]
  def change
    remove_column :users, :referred_by
  end
end
