class AddCoordinatesToAddress < ActiveRecord::Migration[7.1]
  def change
    add_column :addresses, :latitude, :float
    add_index :addresses, :latitude
    add_column :addresses, :longitude, :float
    add_index :addresses, :longitude
  end
end
