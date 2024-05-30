class AddPilgrimToChurches < ActiveRecord::Migration[7.1]
  def change
    add_reference :churches, :pilgrim, null: false, foreign_key: true
  end
end
