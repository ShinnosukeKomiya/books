FactoryBot.define do
  factory :user do
    name "Example"
    sequence(:email) { |n| "tester#{n}@example.com" }
    password "password"
    password_confirmation "password"
    admin true
    # 有効化
    #activated true
  end

  factory :other_user do
    name "Admin"
    sequence(:email) { |n| "tester#{n}@admin.com" }
    password "admin"
    password_confirmation "admin"
    # 有効化
    #activated true
  end
end
