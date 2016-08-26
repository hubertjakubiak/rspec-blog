FactoryGirl.define do
  factory :post do
    title    { Faker::Lorem.sentences(1) }
    content  { Faker::Lorem.paragraph(2) }
  end
end