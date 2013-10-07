FactoryGirl.define do


  factory :user do
    sequence(:email) {|n| "test#{n}@example.com" }
    password "test123"
    password_confirmation { |u| u.password }
  end

  factory :category do
    sequence (:name) {|n| "Category #{n}"}

    ignore do
      merchant_count 5
    end

    after(:create) do |cat, evaluator|
      FactoryGirl.create_list(:merchant, evaluator.merchant_count, category: cat)
    end
  end

  factory :merchant do
    sequence (:name) {|n| "Merchant #{n}"}
    description "Description of Merchant"
    price_range 3
    approved true
    category
    user

    factory :unpproved_merchant do
      approved false
    end

    factory :approved_merchant do
      approved true
    end
  end

  factory :coupon do
    sequence (:name) {|n| "Coupon #{n}"}
    description "Coupon Description"
    begin_date 1.month.ago
    end_date 1.month.from_now
    hidden false
    merchant
    category

    factory :valid_visible_coupon do
    end

    factory :expired_coupon do
      end_date 2.weeks.ago
    end
    factory :future_coupon do
      begin_date 2.weeks.from_now
    end
    factory :hidden_coupon do
      hidden true
    end
  end

  factory :point_of_contact do
    sequence (:name) {|n| "POC #{n}"}
    phone "(123) 555-5555"
    email "POC Email"
    merchant
  end


end
