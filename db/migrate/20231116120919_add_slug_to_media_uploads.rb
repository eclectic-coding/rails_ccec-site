class AddSlugToMediaUploads < ActiveRecord::Migration[7.1]
  def change
    add_column :media_uploads, :slug, :string
    add_index :media_uploads, :slug, unique: true
  end
end
