# == Schema Information
#
# Table name: media_uploads
#
#  id          :uuid             not null, primary key
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
FactoryBot.define do
  factory :media_upload do
    name { "MyString" }
    description { "MyString" }
    tag_list { "my_docs" }
    views_count { 1 }

    after(:build) do |media_upload|
      media_upload.media_file.attach(
        io: File.open(Rails.root.join("spec", "support", "assets", "test.pdf")),
        filename: "test.pdf",
        content_type: "application/pdf"
      )
    end
  end
end
