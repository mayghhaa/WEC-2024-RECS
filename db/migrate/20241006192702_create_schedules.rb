class CreateSchedules < ActiveRecord::Migration[7.1]
  def change
    create_table :schedules do |t|
      t.references :club, null: false, foreign_key: true
      t.date :pre_recruitment_talk_date
      t.string :pre_recruitment_talk_venue
      t.boolean :tasks_applicable
      t.date :tasks_due_date
      t.boolean :oa_applicable
      t.date :oa_date
      t.date :interview_start_date
      t.date :interview_end_date
      t.string :interview_venue
      t.date :result_date

      t.timestamps
    end
  end
end
