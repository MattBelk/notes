FactoryBot.define do
  factory :user do
    name { Faker::Name.first_name }
    email { Faker::Internet.email }
    password { "password" } 
    password_confirmation { "password" }
    confirmed_at { Date.today }

    factory :user_with_notes do
      transient do
        notes_count { 5 }
      end
      after(:create) do |user, evaluator|
        create_list(:note, evaluator.notes_count, user: user)
      end
    end
  end
end