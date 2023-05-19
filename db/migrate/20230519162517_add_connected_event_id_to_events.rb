class AddConnectedEventIdToEvents < ActiveRecord::Migration[7.0]
  def change
    add_column :events, :connected_event_id, :string
  end
end
