class AddDetailsToRounds < ActiveRecord::Migration[7.1]
  def change
    add_column :rounds, :round_number, :integer
    add_column :rounds, :schedule_id, :integer
  end
end
