class AddMembershipToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :membership, :string
  end
end
