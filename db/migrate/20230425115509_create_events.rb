class CreateEvents < ActiveRecord::Migration[7.0]
  def change
    create_table :events, id: :uuid do |t|
      t.belongs_to :address, foreign_key: true
      t.string :name
      t.datetime :start_time
      t.text :recurring
      t.string :role
      t.datetime :end_time
      t.integer :type

      t.timestamps
    end
  end
end
