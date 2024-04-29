class UpdatePolyActiveDefault < ActiveRecord::Migration[7.1]
  def change
    change_column_default :poly_actives, :active, from: false, to: true
  end
end
