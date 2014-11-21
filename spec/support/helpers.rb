module RSpecHelpers
  module InstanceMethods

    def sign_in(user)
      visit '/login'

      within '#new_user_session' do
        fill_in 'Username', with: user.username
        fill_in 'Password', with: user.password
        click_button 'Login'
      end
    end

  end
end

begin
  RSpec.configure do |config|
    config.include(RSpecHelpers::InstanceMethods)
  end
rescue
  Rails.logger.error("Rspec not defined")
end
