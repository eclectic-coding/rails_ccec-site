class CreateMediaUploads < ActiveRecord::Migration[7.1]
  def change
    create_table :media_uploads do |t|
      t.string :name
      t.string :description
      t.integer :views_count, default: 0

      t.timestamps
    end
  end
end
