# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
10.times do
user = User.create!(email: Faker::Internet.email, username: Faker::Internet.user_name, password: Faker::Internet.password)
  5.times do
    user.ideas.create(title: Faker::Hacker.verb, body: LiterateRandomizer.paragraph)
  end
end

User.create!(email: Faker::Internet.email, username: "Franklin", password: "1234", role: "admin")
