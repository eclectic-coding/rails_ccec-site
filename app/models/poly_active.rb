# == Schema Information
#
# Table name: poly_actives
#
#  id               :bigint           not null, primary key
#  activatable_type :string           not null
#  active           :boolean          default(TRUE)
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  activatable_id   :bigint           not null
#
# Indexes
#
#  index_poly_actives_on_activatable  (activatable_type,activatable_id)
#
class PolyActive < ApplicationRecord
  belongs_to :activatable, polymorphic: true
end
