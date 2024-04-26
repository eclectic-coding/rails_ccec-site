class CreatePolyActives < ActiveRecord::Migration[7.1]
  def change
    create_table :poly_actives, id: :uuid do |t|
      t.boolean :active, default: false
      t.references :activatable, polymorphic: true, null: false, type: :uuid

      t.timestamps
    end
  end
end
