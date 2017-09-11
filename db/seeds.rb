# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
IMAGES = []
CATEGORIES = []

30.times do
  CATEGORIES << Category.create(name: Faker::Hacker.ingverb)
end

20.times do
  IMAGES << Image.create(name: Faker::Name.first_name, url: Faker::Fillmurray.image)
end

10.times do
user = User.create!(email: Faker::Internet.email, username: Faker::Internet.user_name, password: Faker::Internet.password)
  5.times do
    idea = user.ideas.create(title: Faker::Hacker.verb, body: LiterateRandomizer.paragraph)
    3.times do
      idea.images << IMAGES.sample
    end
  end
end

admin = User.create!(email: Faker::Internet.email, username: "Franklin", password: "1234", role: "admin")
10.times do
  idea = admin.ideas.create(title: Faker::Hacker.verb, body: LiterateRandomizer.paragraph, category_id: CATEGORIES.sample)
  4.times do
    idea.images << IMAGES.sample
  end
end
