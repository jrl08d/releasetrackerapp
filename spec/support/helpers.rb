module RSpecHelpers
  module InstanceMethods
  end
end

begin
  RSpec.configure do |config|
    config.include(RSpecHelpers::InstanceMethods)
  end
rescue
  Rails.logger.error("Rspec not defined")
end
