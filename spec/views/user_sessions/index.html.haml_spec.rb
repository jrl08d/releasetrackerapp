require 'rails_helper'

RSpec.describe "user_sessions/index", :type => :view do
  before(:each) do
    assign(:user_sessions, [
      UserSession.create!(
        :username => "Username",
        :password => "Password"
      ),
      UserSession.create!(
        :username => "Username",
        :password => "Password"
      )
    ])
  end

  it "renders a list of user_sessions" do
    render
    assert_select "tr>td", :text => "Username".to_s, :count => 2
    assert_select "tr>td", :text => "Password".to_s, :count => 2
  end
end
