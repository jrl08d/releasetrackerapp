require 'rails_helper'

RSpec.describe "UserSessions", :type => :request do
  describe "GET /user_sessions" do
    it "works! (now write some real specs)" do
      get user_sessions_path
      expect(response.status).to be(200)
    end
  end
end
