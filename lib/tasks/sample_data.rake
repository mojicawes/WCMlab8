require 'faker'

namespace :db do
  desc "Fill database with sample data"
  task :populate => :environment do
    
    
    User.all(:limit => 6).each do |user|
      50.times do
        user.items.create!(:title => Faker::Lorem.sentence(2),
                           :body => Faker::Lorem.sentence(5),
                           :done => false)
      end
    end
  end
end
