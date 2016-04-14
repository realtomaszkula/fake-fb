200.times do
  User.create(
    name: Faker::Name.name,
    password: 'test12345',
    email: Faker::Internet.email,
    birthdate: Faker::Date.between(60.years.ago, 10.years.ago),
    gender: %w{M F}.sample
    )
end

  User.create(
    name: 'admin',
    password: 'password',
    email: 'test@test.pl',
    birthdate: Faker::Date.between(60.years.ago, 10.years.ago),
    gender: 'M'
    )