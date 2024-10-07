class CreateRegistrations < ActiveRecord::Migration[7.1]
  def change
    create_table :registrations do |t|
      t.references :user, null: false, foreign_key: true
      t.references :club, null: false, foreign_key: true

      t.timestamps
    end

    add_index :registrations, [:user_id, :club_id], unique: true
  end
end
