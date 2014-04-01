# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do |u|
    u.sequence(:email) {|n| "test#{n}@mail.com" }
    u.password "Password123"
    u.password_confirmation "Password123"
    u.admin true
  end
end
