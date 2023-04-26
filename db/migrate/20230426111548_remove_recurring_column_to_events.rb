class RemoveRecurringColumnToEvents < ActiveRecord::Migration[7.0]
  def change
    remove_column :events, :recurring, :text
  end
end
