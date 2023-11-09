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
FactoryBot.define do
  factory :media_upload do
    name { "MyString" }
    description { "MyString" }
    views_count { 1 }

    after(:build) do |media_upload|
      media_upload.media_file.attach(
        io: File.open(Rails.root.join("spec", "support", "assets", "image.png")),
        filename: "image.png",
        content_type: "image/png"
      )
    end
  end
end
