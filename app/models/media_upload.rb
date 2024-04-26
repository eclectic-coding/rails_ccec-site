# == Schema Information
#
# Table name: media_uploads
#
#  id          :bigint           not null, primary key
#  description :string
#  name        :string
#  slug        :string
#  views_count :integer          default(0)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
# Indexes
#
#  index_media_uploads_on_slug  (slug) UNIQUE
#
class MediaUpload < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: :slugged

  has_one_attached :media_file
  acts_as_taggable_on :tags

  validates :name, presence: true
  validates :tag_list, presence: true
  validates :media_file, attached: true, content_type: 'application/pdf'
end
