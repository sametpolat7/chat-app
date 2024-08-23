class RemoveMembershipFromUsers < ActiveRecord::Migration[7.1]
  def change
    remove_column :users, :membership, :string
  end
end
