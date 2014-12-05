class Comment < ActiveRecord::Base
  belongs_to :issue
  belongs_to :user
  validates_presence_of :body, :issue_id, :user_id
end
