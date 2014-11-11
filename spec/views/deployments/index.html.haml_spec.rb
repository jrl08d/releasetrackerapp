require 'rails_helper'

RSpec.describe "deployments/index", :type => :view do
  before(:each) do
    assign(:deployments, [
      Deployment.create!(),
      Deployment.create!()
    ])
  end

  it "renders a list of deployments" do
    render
  end
end
