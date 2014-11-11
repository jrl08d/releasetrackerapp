require 'rails_helper'

RSpec.describe "deployments/show", :type => :view do
  before(:each) do
    @deployment = assign(:deployment, Deployment.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
