require 'capybara'

RSpec.configure do |config|
  config.include Capybara::DSL

  config.expect_with :rspec do |c|
    c.syntax = :should
  end

  config.mock_with :rspec do |c|
    c.syntax = :should
  end
end
