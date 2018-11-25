require 'active_record'
require 'faker'

namespace :db do

  desc 'Clear base and fill it with random data'
  task :fill => [:check_env, "db:reset", :fill_random]


  task :check_env => :environment do
    if Rails.env.production?
      raise 'I\'m sorry but I can\'t fill the base into production environment!'
    end
  end

  task :fill_random => :environment do
    # make some users
    rand(5..15).times.each do
      u = User.new
      u.name = Faker::Name.unique.name
      u.email = Faker::Internet.email u.name
      u.save

      # make some posts
      rand(2..7).times.each do
        p = Post.new
        p.user = u
        p.header = Faker::Lorem.sentence
        p.body = Faker::Lorem.paragraph rand(1..4)
        p.content = 0
        p.save
      end
    end

    #make some comments
    users = User.all
    posts = Post.all
    comments_quantity = 1_000
    comments_quantity.times.each do
      u = users.sample
      p = posts.sample
      c = Comment.new
      c.user = u
      c.post = p
      c.body = Faker::Lorem.sentence
      c.save
    end

    puts "There are generated users: #{users.size}, posts: #{posts.size}, comments: #{comments_quantity}"

  end


end
