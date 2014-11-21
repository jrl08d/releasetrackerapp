require 'rails_helper'

RSpec.describe "Deployments lookup" do

  before(:each) do
    @deployments_count = 5

    @deployments_count.times do
      FactoryGirl.create :customer
      FactoryGirl.create :release
      FactoryGirl.create :deployment
    end

    Deployment.count.should == @deployments_count

    # TODO: Add factory for User and use it here to refactor this code :)
    @user = User.create!({
      username: 'testuser',
      email: 'test@example.com',
      admin: true,
      password: password = '123456',
      password_confirmation: password
    })

    sign_in(@user)
  end


  pending "should should list of deployments"


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
