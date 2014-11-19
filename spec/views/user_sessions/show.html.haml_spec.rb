require 'rails_helper'

RSpec.describe "user_sessions/show", :type => :view do
  before(:each) do
    @user_session = assign(:user_session, UserSession.create!(
      :username => "Username",
      :password => "Password"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Username/)
    expect(rendered).to match(/Password/)
  end
end
