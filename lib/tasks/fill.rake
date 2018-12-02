require 'active_record'
require 'faker'

namespace :db do

  desc 'Clear base and fill it with random data'
  task :fill => [:check_env, "db:reset", "db:seed"]


  task :check_env => :environment do
    if Rails.env.production?
      raise 'I\'m sorry but I can\'t fill the base into production environment!'
    end
  end

end
