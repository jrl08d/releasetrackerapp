class Release < ActiveRecord::Base
	has_many :deployments
end
