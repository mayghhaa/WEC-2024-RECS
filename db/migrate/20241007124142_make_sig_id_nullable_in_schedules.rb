class MakeSigIdNullableInSchedules < ActiveRecord::Migration[7.1]
  def change
    change_column_null :schedules, :sig_id, true
  end
end
