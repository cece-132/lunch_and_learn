FactoryBot.define do
  factory :favorite do
    api_key { user }
    country { Faker::Internet.safe_email }
    recipe_link { Faker::Internet.url }
    recipe_title { Faker::Book.title }
  end
end                         