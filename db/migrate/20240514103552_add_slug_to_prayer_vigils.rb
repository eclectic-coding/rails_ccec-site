class AddSlugToPrayerVigils < ActiveRecord::Migration[7.1]
  def change
    add_column :prayer_vigils, :slug, :string
    add_index :prayer_vigils, :slug, unique: true
  end
end
