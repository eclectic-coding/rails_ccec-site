class AddWalkNumberToPrayerVigil < ActiveRecord::Migration[7.1]
  def change
    add_column :prayer_vigils, :walk_number, :integer
  end
end
