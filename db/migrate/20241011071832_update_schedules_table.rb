class UpdateSchedulesTable < ActiveRecord::Migration[7.1]
  def change
    change_table :schedules do |t|
      t.remove :pre_recruitment_talk_date, :pre_recruitment_talk_venue,
                :tasks_applicable, :tasks_due_date,
                :oa_applicable, :oa_date,
                :interview_start_date, :interview_end_date,
                :interview_venue, :result_date
      t.string :name  # Add a name column for the schedule
    end
  end
end
