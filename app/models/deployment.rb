class Deployment < ActiveRecord::Base
	belongs_to :customer
	belongs_to :release
end
