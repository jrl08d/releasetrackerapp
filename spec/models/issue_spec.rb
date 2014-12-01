require 'rails_helper'

RSpec.describe Issue, :type => :model do


  context 'indexes' do
    it { should have_db_index(:release_id) }
    it { should have_db_index(:customer_id) }
  end

  context 'associations' do
    it { should belong_to(:release) }
    it { should belong_to(:customer) }
  end


  #TODO How do we test these in Rails 4?
  # context 'mass assignment' do
  #   it { should allow_mass_assignment_of(:release_id) }
  #   it { should allow_mass_assignment_of(:customer_id) }
  # end

  context 'validations' do
    it { should validate_presence_of(:deploy_date) }
    it { should validate_presence_of(:release_id) }
    it { should validate_uniqueness_of(:release_id) }
  end
end