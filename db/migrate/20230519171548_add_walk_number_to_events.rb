class AddWalkNumberToEvents < ActiveRecord::Migration[7.0]
  def change
    add_column :events, :walk_number, :integer
  end
end
