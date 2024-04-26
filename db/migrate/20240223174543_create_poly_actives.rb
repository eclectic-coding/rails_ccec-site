class CreatePolyActives < ActiveRecord::Migration[7.1]
  def change
    create_table :poly_actives do |t|
      t.boolean :active, default: false
      t.references :activatable, polymorphic: true, null: false

      t.timestamps
    end
  end
end
