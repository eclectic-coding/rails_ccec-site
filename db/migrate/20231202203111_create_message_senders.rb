class CreateMessageSenders < ActiveRecord::Migration[7.1]
  def change
    create_table :message_senders, id: :uuid do |t|
      t.string :name
      t.string :email

      t.timestamps
    end
  end
end
