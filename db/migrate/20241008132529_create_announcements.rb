class CreateAnnouncements < ActiveRecord::Migration[7.1]
  def change
    create_table :announcements do |t|
      t.string :subject
      t.text :content
      t.references :club, foreign_key: true
      t.references :sig, foreign_key: true
      t.timestamps
    end
  end
end
