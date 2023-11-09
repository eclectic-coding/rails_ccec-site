# == Schema Information
#
# Table name: media_uploads
#
#  id          :uuid             not null, primary key
#  description :string
#  name        :string
#  views_count :integer          default(0)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class MediaUpload < ApplicationRecord
  has_one_attached :media_file

  validates :name, presence: true
  validates :media_file, presence: true
end
