class AddStatusToRegistrations < ActiveRecord::Migration[7.1]
  def change
    add_column :registrations, :status, :string
  end
end
