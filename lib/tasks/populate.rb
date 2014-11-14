# lib/tasks/populate.rake
#
# Rake task to populate development database with test data
# Run it with "rake db:populate"
# See Railscast 126 and the faker website for more information

namespace :db do
  desc "Erase and fill database"
  task :populate => :environment do
    require 'faker'

    Rake::Task['db:reset'].invoke

    # Create some customers
    15.times do |c|
      customer = Customer.create!(:name => Faker::Company.name)

      # Create deployments for customers
      5.times do |e|
        Deployment.create!(:deploy_date => (rand(10-1)+1).days.ago.to_date,

          :note => Faker::Lorem.paragraph(sentence_count = 3),
          :version_id => (rand(10-1)+1),
          :customer_id => deployment.customer_id)
      end
    end

    20.times do |r|
    	release = Release.create!(:version => (rand(10-1)+1),
    		:comments => Faker::Lorem.sentences)
    end
  end
end