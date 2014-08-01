FactoryGirl.define do
  factory :user do
    email "user@example.com"
    username "test_user"
    password_digest "password"
  end

  factory :text_shout do
    body "The quick brown fox jumped over the lazy dogs."
  end
end
