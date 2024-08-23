class AddEnumMembershipToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :membership, :integer, default: 0
  end
end
