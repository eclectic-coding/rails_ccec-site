# == Schema Information
#
# Table name: editables
#
#  id         :bigint           not null, primary key
#  content    :text
#  shortname  :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_editables_on_shortname  (shortname) UNIQUE
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
