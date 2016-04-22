FactoryGirl.define do
  factory :item do
    description nil
    association :user
    source { Faker::Internet.url }
  end

  factory :link, parent: :item do
    description "Link"
  end

  factory :image, parent: :item do
    description "Image"
    url {
       sample_image_path = 'spec/fixtures/images/book.jpg'
       Rack::Test::UploadedFile.new(sample_image_path, 'image/jpeg')
    }
  end
end
