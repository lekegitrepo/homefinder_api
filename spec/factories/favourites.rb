FactoryBot.define do
  factory :favourite do
    user { association :user }
    home { association :home }
  end
end
