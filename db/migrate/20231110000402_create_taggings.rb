class CreateTaggings < ActiveRecord::Migration[7.1]
  def change
    create_table :taggings, id: :uuid do |t|
      t.belongs_to :tag, null: false, foreign_key: true, type: :uuid
      t.belongs_to :media_uploads, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
