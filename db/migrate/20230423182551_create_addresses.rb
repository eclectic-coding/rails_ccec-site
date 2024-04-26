class CreateAddresses < ActiveRecord::Migration[7.0]
  def change
    create_table :addresses do |t|
      t.string :name
      t.string :street
      t.string :city
      t.string :state, default: "NC"
      t.integer :zip_code

      t.timestamps
    end
  end
end
