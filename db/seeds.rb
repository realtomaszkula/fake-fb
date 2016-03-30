200.times do
  User.create(
    name: Faker::Name.name,
    email: Faker::Internet.email,
    birthdate: Faker::Date.between(60.years.ago, 10.years.ago),
    gender: %w{M F}.sample
    )
end