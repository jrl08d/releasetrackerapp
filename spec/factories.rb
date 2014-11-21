FactoryGirl.define do

  factory :user do
    username "testuser"
    email "test@example.com"
    admin true
    password "123456"
    password_confirmation "123456"
  end

  factory :basic_user, class: User do
    username "basicuser"
    email "basic@example.com"
    admin false
    password "12345678"
    password_confirmation "12345678"
  end


  factory :customer do
    before(:create) do |object|
      object.user = FactoryGirl.create(:basic_user)
      factory :customer_with_deployment do
        after(:create) do |customer|
          create(:deployment, customer: customer)
        end
      end
    end
    name { Faker::Company.name } 
  end

  factory :deployment do

    before(:create) do |object|
      unless object.customer && object.release 
        unique_deployment = false
        begin
           object.customer = Customer.references(:deployments).includes(:deployments).where("deployments.id IS NULL").order("RANDOM()").first || Customer.order("RANDOM()").first
           object.release = Release.order("RANDOM()").first
           unique_deployment = ! Deployment.exists?(customer: object.customer, release: object.release)
        end until unique_deployment
      end
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
    release_date {Faker::Date.between(2.years.ago, Date.today)}
  end

end
