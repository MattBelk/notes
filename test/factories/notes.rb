FactoryBot.define do
  factory :note do
    title { Faker::Lorem.sentence(word_count: 4) }
    user
  end
end
