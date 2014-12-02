require 'rails_helper'

RSpec.describe "Deployments lookup" do

  context "as admin" do

    before(:each) do
      @deployments_count = 5

      @deployments_count.times do
        create :deployment
      end

      Deployment.count.should == @deployments_count



      @user = create(:admin)
      sign_in @user
    end

    it "should show list of deployments" do
      visit "/deployments"
      page.should have_text("History")
    end


    it "should allow filtering of customers" do
      visit '/deployments'

      page.should have_selector('table tr', count: @deployments_count)

      customer = Customer.last

      select customer.name, from: :customer_filter
      click_on 'Filter'

      page.should have_selector('table tr', :count => customer.deployments.count)
    end

    it "should allow clearing of filter" do
      visit '/deployments'

      find('select#customer_filter').find("option[value='']").select_option
      click_on 'Filter'

      page.should have_selector('table tr', :count => @deployments_count)
    end
  end

  context "as basic user" do
    before(:each) do
      @deployment = create(:deployment)


      @basic_user = @deployment.customer.users.first
      sign_in @basic_user
    end

    it "should show list of deployments" do
      visit "/deployments"
      page.should have_text("History")
    end

    it "should only show deployments of the Customer of the user" do
      visit "/deployments"
      page.should have_text("#{@deployment.customer.name}")
      page.should have_selector('table tr', :count => 1)
    end
  end

end
