class CreateEditables < ActiveRecord::Migration[7.1]
  def change
    create_table :editables do |t|
      t.string :shortname
      t.text :content

      t.timestamps
    end
  end
end
