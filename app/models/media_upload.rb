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
  has_many :taggings, dependent: :destroy
  has_many :tags, through: :taggings

  has_one_attached :media_file

  validates :name, presence: true
  validates :media_file, presence: true

  def self.tagged_with(name)
    Tag.find_by!(name: name).media_uploads
  end

  def self.tag_counts
    Tag.select("tags.*, count(taggings.tag_id) as count").joins(:taggings).group("taggings.tag_id")
  end

  def tag_list
    tags.map(&:name).join(", ")
  end

  def tag_list=(names)
    self.tags = names.split(",").map do |n|
      Tag.where(name: n.strip).first_or_create!
    end
  end
end
