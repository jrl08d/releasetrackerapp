require 'rails_helper'

RSpec.describe "user_sessions/edit", :type => :view do
  before(:each) do
    @user_session = assign(:user_session, UserSession.create!(
      :username => "MyString",
      :password => "MyString"
    ))
  end

  it "renders the edit user_session form" do
    render

    assert_select "form[action=?][method=?]", user_session_path(@user_session), "post" do

      assert_select "input#user_session_username[name=?]", "user_session[username]"

      assert_select "input#user_session_password[name=?]", "user_session[password]"
    end
  end
end
