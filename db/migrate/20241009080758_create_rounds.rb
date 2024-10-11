class CreateRounds < ActiveRecord::Migration[7.1]
  def change
    create_table :rounds do |t|
      t.string :round_name
      t.string :round_type
      t.date :start_date
      t.date :end_date
      t.string :venue
      t.string :link
      t.references :club, foreign_key: true, null: true  # Optional for clubs
      t.references :sig, foreign_key: true, null: true   # Optional for SIGs

      t.timestamps
    end
  end
end
