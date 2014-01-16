FactoryGirl.define do
  factory :page do
    text { generate :string }
    title { generate :string }
  end
end
