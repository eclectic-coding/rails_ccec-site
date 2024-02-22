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
end
