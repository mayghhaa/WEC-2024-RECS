class AddSigToSchedules < ActiveRecord::Migration[7.1]
  def change
    add_reference :schedules, :sig, foreign_key: true, null: true
  end
end
