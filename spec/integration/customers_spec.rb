require 'rails_helper'

RSpec.describe "Customer lookup" do

  before(:each) do
    10.times do
      FactoryGirl.create :customer
    end

    Customer.count.should == 10
  end

  it "should display a list of customers" do
    visit '/customers'
  end


  #testing i18n translations
  describe "GET 'index'" do
    before do
      get 'index'
    end
    it "should be successful" do
      response.should be_redirect
    end
  end

end


RSpec.describe "Deployment History lookup" do

	it "should display the history of all deployments to date" do
		visit '/deployments'
	end
end 
