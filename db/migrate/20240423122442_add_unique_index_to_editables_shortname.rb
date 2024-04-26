class AddUniqueIndexToEditablesShortname < ActiveRecord::Migration[7.1]
  def change
    add_index :editables, :shortname, unique: true
  end
end
