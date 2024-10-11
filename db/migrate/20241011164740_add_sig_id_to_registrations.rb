class AddSigIdToRegistrations < ActiveRecord::Migration[7.1]
  def change
    add_column :registrations, :sig_id, :integer
  end
end
