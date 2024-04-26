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
FactoryBot.define do
  factory :editable do
    shortname { "MyString" }
    content { "MyText" }
  end
end
