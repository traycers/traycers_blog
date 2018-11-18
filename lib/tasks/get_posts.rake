require 'active_record'

namespace :db do

  desc 'get posts which are written moderators'
  task :get_posts => :environment do
    puts 'Moderators wrote these posts:'
    p Post.includes(:user).where("moderator = true").references(:users).pluck(:id, :header)
  end

end
