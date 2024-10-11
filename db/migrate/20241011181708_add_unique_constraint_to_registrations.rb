class AddUniqueConstraintToRegistrations < ActiveRecord::Migration[7.1]
  def change
    remove_index :registrations, [:user_id, :club_id]  # Remove the current unique index
    add_index :registrations, [:user_id, :club_id, :sig_id], unique: true  # Add the new unique index
  end
end
