class AddMessageRecipientToMessages < ActiveRecord::Migration[7.1]
  def change
    add_reference :messages, :message_recipient, type: :uuid, foreign_key: true
  end
end
