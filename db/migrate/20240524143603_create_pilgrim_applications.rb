class CreatePilgrimApplications < ActiveRecord::Migration[7.1]
  def change
    create_table :pilgrim_applications do |t|
      t.string :payment_method
      t.decimal :payment_amount

      t.timestamps
    end
  end
end
