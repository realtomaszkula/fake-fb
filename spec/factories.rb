FactoryGirl.define do
  factory :profile do
    user nil
  end
  factory :profile do
    references ""
  end
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