require 'rails_helper'

RSpec.describe "user_sessions/new", :type => :view do
  before(:each) do
    assign(:user_session, UserSession.new(
      :username => "MyString",
      :password => "MyString"
    ))
  end

  it "renders new user_session form" do
    render

    assert_select "form[action=?][method=?]", user_sessions_path, "post" do

      assert_select "input#user_session_username[name=?]", "user_session[username]"

      assert_select "input#user_session_password[name=?]", "user_session[password]"
    end
  end
end
