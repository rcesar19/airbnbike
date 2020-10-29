require 'faker'

5.times do
  User.create!(
    email: Faker::Internet.email,
    password: 123456
    )
end

users = User.all

users.each do |user|
  Place.create!(
    name: Faker::Restaurant.name,
    address: Faker::Address.street_address,
    description: Faker::ChuckNorris.fact,
    user_id: user.id
    )
end
