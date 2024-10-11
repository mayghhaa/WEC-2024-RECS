class AddClubIdToSchedules < ActiveRecord::Migration[7.1]  # Use your Rails version
  def change
    add_column :schedules, :club_id, :integer
    add_index :schedules, :club_id  # Optional: Add an index for faster lookups
  end
end
