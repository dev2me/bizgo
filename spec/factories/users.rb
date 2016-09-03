FactoryGirl.define do
  factory :user do
    email "hi@example.com"
    name "Andrés"
    provider "facebook"
    uid "1234567890"
    factory :dummy_user do
      email "hola@example.com"
      name "José"
      provider "facebook"
      uid "1234567344"
    end
    factory :sequence_user do 
      sequence(:email) { |n| "user#{n}@example.com"}
      name "Manuel"
      provider "facebook"
      uid "021456"
    end
  end
end
