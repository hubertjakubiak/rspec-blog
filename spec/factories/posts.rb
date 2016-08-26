FactoryGirl.define do
  factory :post do
    title { Faker::Lorem.sentence }
    content { Faker::Lorem.sentence }
  end

end
