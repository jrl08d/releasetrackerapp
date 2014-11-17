require 'rails_helper'

RSpec.describe "Customer lookup" do

  it "should display a list of customers" do
    visit '/customers'
  end

end


RSpec.describe "Deployment History lookup" do

	it "should display the history of all deployments to date" do
		visit '/deployments'
	end
end 