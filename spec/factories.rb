
FactoryGirl.define do
  factory :user do
    email "user@example.com"
    username "test_user"
    password_digest "password"
  end
end
