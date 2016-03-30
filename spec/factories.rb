FactoryGirl.define do
  factory :like do
    count 1
    parent nil
  end
  factory :comment do
    content "MyString"
    author nil
    parent nil
  end
  factory :post do
    content "MyString"
    author nil
  end
  factory :user do
    name 'Tomasz'
  end
end