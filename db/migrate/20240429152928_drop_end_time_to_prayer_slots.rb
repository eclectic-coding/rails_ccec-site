class DropEndTimeToPrayerSlots < ActiveRecord::Migration[7.1]
  def change
    remove_column :prayer_slots, :end_time, :datetime
  end
end
