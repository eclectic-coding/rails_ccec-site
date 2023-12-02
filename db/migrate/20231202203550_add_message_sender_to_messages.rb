class AddMessageSenderToMessages < ActiveRecord::Migration[7.1]
  def change
    add_reference :messages, :message_sender, type: :uuid, foreign_key: true
  end
end
