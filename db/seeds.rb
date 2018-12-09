# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

# make some users
rand(5..15).times.each do |i|
  u = User.new
  u.name      = Faker::Name.unique.name
  u.email     = Faker::Internet.email u.name
  u.password  = :Qw4asdZXC
  u.save

  # make some posts
  rand(2..7).times.each do |y|
    p = Post.new
    p.user    = u
    p.header  = Faker::Lorem.sentence
    p.body    = Faker::Lorem.paragraph rand(1..4)
    p.content = 0
    p.save
  end
end

#make some comments
users = User.all
posts = Post.all
rand(10..30).times.each do |i|
  u = users.sample
  p = posts.sample
  c = Comment.new
  c.user = u
  c.post = p
  c.body = Faker::Lorem.sentence
  c.save
end


