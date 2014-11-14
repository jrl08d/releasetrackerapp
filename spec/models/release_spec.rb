require 'rails_helper'

RSpec.describe Release, :type => :model do

  context 'indexes' do
    pending { should have_index(:version) }
  end

  context 'associations' do
   it { should have_many(:deployments) }
    it { should have_many(:customers, through: :deployments) }
  end

  #TODO How do we test these in Rails 4?
  # context 'mass assignment' do
  #   it { should allow_mass_assignment_of(:release_id) }
  #   it { should allow_mass_assignment_of(:customer_id) }
  # end

  context 'validations' do
    it { should validate_presence_of(:version) }
    it { should validate_uniqueness_of(:version) }
  end


end
