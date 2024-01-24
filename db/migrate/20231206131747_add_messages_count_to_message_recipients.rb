class AddMessagesCountToMessageRecipients < ActiveRecord::Migration[7.1]
  def self.up
    add_column :message_recipients, :messages_count, :integer, null: false, default: 0
  end

  def self.down
    remove_column :message_recipients, :messages_count
  end
end
