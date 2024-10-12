class AddExclusiveColumnToClubs < ActiveRecord::Migration[7.1]
  def change
    add_column :clubs, :exclusive, :boolean, default: true
  end
end
