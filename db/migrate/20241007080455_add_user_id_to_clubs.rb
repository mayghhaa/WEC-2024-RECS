class AddUserIdToClubs < ActiveRecord::Migration[7.1]
  def change
    add_column :clubs, :user_id, :integer
  end
end
