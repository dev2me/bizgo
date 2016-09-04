FactoryGirl.define do
  factory :user do
    email {generate(:user_mail)}
    name {generate(:user_name)}
    provider "facebook"
    uid "0998764562"
    factory :dummy_user do
      email "hola@example.com"
      name "José"
      provider "facebook"
      uid "1234567344"
    end
  end
  sequence :user_name do |n|
    "Andrés#{n}"
  end
  sequence :user_mail do |n|
    "hi_#{n}@example.com"
  end
end
