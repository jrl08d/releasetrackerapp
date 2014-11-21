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
  		basic=FactoryGirl.create(:basic_user)
  		ability = Ability.new(basic)
    	ability.cannot?(:manage, Deployment).should == true
    	ability.cannot?(:manage, Customer).should == true
    	ability.cannot?(:manage, Release).should == true
    	ability.can?(:read, Release).should == true

      @deployment = FactoryGirl.create(:deployment, {
       customer: FactoryGirl.create(:customer),
       release: FactoryGirl.create(:release)
      })

      @deployment.customer.user.should_not == nil
      @deployment.customer.user.should_not == basic

    	ability.can?(:read, @deployment).should == true
	end	
  end
end
