class RemoveClubIdFromSchedules < ActiveRecord::Migration[7.1]
  def change
    remove_column :schedules, :club_id, :integer
  end
end
