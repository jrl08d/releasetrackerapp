require 'rails_helper'

RSpec.describe Customer, :type => :model do

  context 'indexes' do
    it { should have_db_index(:name) }
    it { should have_db_index(:user_id) }
  end

  context 'associations' do
    it { should have_many(:deployments) }
    it { should have_many(:releases).through(:deployments)}
    it { should belong_to(:user)}
  end

  #TODO How do we test these in Rails 4?
  # context 'mass assignment' do
  #   it { should allow_mass_assignment_of(:name) }
  # end

  context 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_uniqueness_of(:name) }
  end


end
