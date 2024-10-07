class AddConvenerToClubs < ActiveRecord::Migration[7.1]
  def change
    add_column :clubs, :convener_id, :integer
  end
end
