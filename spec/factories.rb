FactoryGirl.define do
  factory :customer do
  	Customer.destroy_all
    name { Faker::Company.name }
    factory :customer_with_deployment do
    	after(:create) do |customer|
    		create(:deployment, customer: customer)
    	end
    end
  end
  factory :deployment do
  	deploy_date { Faker::Date.between(2.years.ago, Date.today)}
  	version_id { rand(19-1) + 1}
  end

  factory :release do
  	Release.destroy_all
  	version {(rand(6-1) + 1) + ((rand(9-1) + 1) *0.1)}
  end


end