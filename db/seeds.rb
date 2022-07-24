# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
sport = Category.create(name: 'Спорт')
science = Category.create(name: 'Наука')
live = Category.create(name: 'Жизнь')

3.times do
  user = User.new(email: Faker::Internet.email, password: '123456')
  user.save
  3.times do |i|
    Post.create(
      title: Faker::Lorem.sentence,
      body: Faker::Lorem.paragraph,
      creator: user,
      category: [sport, science, live][i]
    )
  end
end
