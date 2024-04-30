class CreateBookings < ActiveRecord::Migration[7.1]
  def change
    create_table :bookings do |t|
      t.string :first_name
      t.string :last_name
      t.references :prayer_vigil, null: false, foreign_key: true
      t.references :prayer_slot, null: false, foreign_key: true

      t.timestamps
    end
  end
end
