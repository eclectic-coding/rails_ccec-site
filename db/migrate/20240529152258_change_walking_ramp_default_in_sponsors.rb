class ChangeWalkingRampDefaultInSponsors < ActiveRecord::Migration[6.0]
  def change
    change_column_default :sponsors, :walking_ramp, from: true, to: false
  end
end
