FactoryGirl.define do
  factory :token do
    #expires_at "2016-08-17 01:15:55"
    association :user, factory: :user
  end
end
