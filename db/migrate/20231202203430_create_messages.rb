class CreateMessages < ActiveRecord::Migration[7.1]
  def change
    create_table :messages, id: :uuid do |t|
      t.text :content
      t.boolean :request_copy

      t.timestamps
    end
  end
end
