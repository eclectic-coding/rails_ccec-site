class CreateMessages < ActiveRecord::Migration[7.1]
  def change
    create_table :messages, id: :uuid do |t|
      t.references :message_recipient, null: false, foreign_key: true, type: :uuid
      t.string :name
      t.string :email
      t.text :content
      t.boolean :request_copy, default: false

      t.timestamps
    end
  end
end
