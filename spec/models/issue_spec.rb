require 'rails_helper'

RSpec.describe Issue, :type => :model do


  context 'indexes' do
    it { should have_db_index(:customer_id) }
  end

  context 'associations' do
    it { should belong_to(:customer) }
  end

  context 'validations' do
    it { should validate_presence_of(:description) }
    it { should validate_presence_of(:reported_date) }
    it { should validate_presence_of(:software_version) }
    it { should validate_presence_of(:reporter_name) }
    it { should validate_presence_of(:severity) }
    it { should validate_presence_of(:status) }
    it { should validate_presence_of(:title) }
  end
end