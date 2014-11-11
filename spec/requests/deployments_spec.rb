require 'rails_helper'

RSpec.describe "Deployments", :type => :request do
  describe "GET /deployments" do
    it "works! (now write some real specs)" do
      get deployments_path
      expect(response.status).to be(200)
    end
  end
end
