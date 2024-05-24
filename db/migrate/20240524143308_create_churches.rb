class CreateChurches < ActiveRecord::Migration[7.1]
  def change
    create_table :churches do |t|
      t.string :name
      t.string :phone
      t.string :street_address
      t.string :city
      t.string :state
      t.string :zipcode
      t.string :pastor
      t.string :church_email

      t.timestamps
    end
  end
end
