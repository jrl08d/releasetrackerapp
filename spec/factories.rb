FactoryGirl.define do
 
  factory :customer do
    name { Faker::Company.name }
    factory :customer_with_deployment do
      after(:create) do |customer|
        create(:deployment, customer: customer)
      end
    end
  end
 
  factory :deployment do
 
    before(:create) do |object|
      unique_deployment = false
      begin
         object.customer = Customer.order("RANDOM()").first
         object.release = Release.order("RANDOM()").first
         unique_deployment = ! Deployment.exists?(customer: object.customer, release: object.release)
      end until unique_deployment
    end
 
    deploy_date { Faker::Date.between(2.years.ago, Date.today)}
  end
 
  factory :release do
    before(:create) do |object|
      unless object.version
        unique_version = false
        begin
          object.version = "#{rand(1..10)}.#{rand(1..20)}.#{rand(1..30)}"
          unique_version = ! Release.exists?(version: object.version)
        end until unique_version
      end
    end
 
    comments {Faker::Lorem.paragraph}
  end
 
end