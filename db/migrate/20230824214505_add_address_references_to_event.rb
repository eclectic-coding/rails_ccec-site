class AddAddressReferencesToEvent < ActiveRecord::Migration[7.0]
  def change
    add_reference :events, :address, type: :uuid, foreign_key: true
  end
end
