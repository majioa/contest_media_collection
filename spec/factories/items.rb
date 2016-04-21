FactoryGirl.define do
  factory :item do
    description nil
  end

  factory :link, parent: :item, class: :Link do
    description "Link"
    source { Faker::Internet.url }
  end

  factory :image, parent: :item, class: :Image do
    description "Image"
    url {
       sample_image_path = 'spec/fixtures/images/book.jpg'
       Rack::Test::UploadedFile.new(sample_image_path, 'image/jpeg')
    }
  end
end
