FactoryBot.define do
  factory :issue do
    id { 1 }
    action { 'open' }
    created_at { DateTime.now }

    trait :issue_event do
      id { 2 }
      issue_id { 1 }
    end
  end
end
