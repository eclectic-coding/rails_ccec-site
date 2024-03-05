# == Schema Information
#
# Table name: editables
#
#  id         :uuid             not null, primary key
#  content    :text
#  shortname  :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Editable < ApplicationRecord
  has_many :poly_actives, as: :activatable, dependent: :destroy

  after_create :create_poly_active

  validates :shortname, presence: true, uniqueness: true
  validates :content, presence: true

  def create_poly_active
    PolyActive.create!(activatable: self)
  end

  def active?
    poly_actives.first&.active
  end
end
