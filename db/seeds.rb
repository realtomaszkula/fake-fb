20.times do
  User.create(
    name: Faker::Name.name,
    password: 'test12345',
    email: Faker::Internet.email,
    birthdate: Faker::Date.between(60.years.ago, 10.years.ago),
    gender: %w{M F}.sample
    )
end

  User.create(
    name: 'Tomasz Kula',
    password: 'password',
    email: 'test@test.pl',
    birthdate: Faker::Date.between(60.years.ago, 10.years.ago),
    gender: 'M'
    )


  user2 = User.find(11)
  user5 = User.find(12)
  admin = User.last

  admin.friendships.create(friend_id: user2.id)
  admin.friendships.create(friend_id: 3)

  user2.friendships.create(friend_id: admin.id)
  user5.friendships.create(friend_id: admin.id)

  User.all.each do |u|
      (1..20).to_a.sample(rand(1..20)).each do |id|
        next if u.id == id
        u.friendships.create(friend_id: id)
    end
  end

  User.take(10).each do |u|
    u.friendships.create(friend_id: admin.id)
    admin.friendships.create(friend_id: u.id)
  end

  3.times do
    admin.posts.create(content: Faker::Hacker.say_something_smart, parent_id: admin.id )
    user2.posts.create(content: Faker::Hacker.say_something_smart, parent_id: admin.id )
    user5.posts.create(content: Faker::Hacker.say_something_smart, parent_id: admin.id )
  end

  users = User.take(20)

  users.each do |u|
    10.times { u.posts.create(content: Faker::Hacker.say_something_smart, parent_id: rand(1..20)) }
  end

  users.each do |u|
    20.times do
      u.likes.create(parent_id: rand(1..200))
      u.comments.create(content: Faker::Hacker.say_something_smart, parent_id: rand(1..200))
    end
  end

  admin.wall_posts.each do |p|
    3.times do
      p.comments.create(
        author_id: rand(1..20),
        content: Faker::Hacker.say_something_smart
        )
    end
    rand(1..20).times do
      p.likes.create(author_id: rand(1..20))
    end
  end

