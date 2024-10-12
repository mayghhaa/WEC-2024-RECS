class AddNameAndRollNumberToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :name, :string
    add_column :users, :roll_number, :string
  end
end
