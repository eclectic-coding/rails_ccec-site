# == Schema Information
#
# Table name: taggings
#
#  id               :uuid             not null, primary key
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  media_uploads_id :uuid             not null
#  tag_id           :uuid             not null
#
# Indexes
#
#  index_taggings_on_media_uploads_id  (media_uploads_id)
#  index_taggings_on_tag_id            (tag_id)
#
# Foreign Keys
#
#  fk_rails_...  (media_uploads_id => media_uploads.id)
#  fk_rails_...  (tag_id => tags.id)
#
class Tagging < ApplicationRecord
  belongs_to :tag
  belongs_to :media_uploads
end
