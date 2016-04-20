FactoryGirl.define do
  factory :user do
    name { FFaker::Name.name }
    email { FFaker::Internet.email }
    password '12345678'
    password_confirmation '12345678'
  end

  factory :invalid_user, class: :User do
    email nil
  end
end
