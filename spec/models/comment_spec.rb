require 'rails_helper'

RSpec.describe Comment, :type => :model do

  context 'indexes' do
    it { should have_db_index(:issue_id) }
  end

  context 'associations' do
    it { should belong_to(:issue) }
    it { should belong_to(:user) }
  end

  context 'validations' do
    it { should validate_presence_of(:body) }
    it { should validate_presence_of(:issue_id) }
    it { should validate_presence_of(:user_id) }
  end


end
