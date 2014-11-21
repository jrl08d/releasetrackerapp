require 'rails_helper'
require "cancan/matchers"

describe "Ability" do
  context "as admin" do
    it "can access all" do
      user=FactoryGirl.create(:user)
      ability = Ability.new(user)
      ability.can?(:manage, :all).should == true
    end
  end
  context "as customer" do
  	it "can view its Deployments & History of Releases" do
  		basic=FactoryGirl.create(:basic)
  		ability = Ability.new(basic)
    	ability.cannot?(:manage, Deployment).should == true
    	ability.cannot?(:manage, Customer).should == true
    	ability.cannot?(:manage, Release).should == true
    	ability.can?(:read, Release).should == true
    	#not sure how to do .... can?(:read [their deployment]).should == true
	end	
  end
end
