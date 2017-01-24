FactoryGirl.define do
  factory :audit_log do
    user nil
    status 1
    start_date "2017-01-24"
    date_verified "2017-01-24"
  end
end
