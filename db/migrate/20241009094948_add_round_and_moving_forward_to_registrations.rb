class AddRoundAndMovingForwardToRegistrations < ActiveRecord::Migration[7.1]
  def change
    add_column :registrations, :round, :integer, default: 1
    add_column :registrations, :moving_forward, :boolean, default: true
  end
end
