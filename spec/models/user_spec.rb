require 'rails_helper'

RSpec.describe User, :type => :model do


  context 'associations' do
    it { should have_one(:customer) }
    it { should have_many(:deployments).through(:customer) }
  end
end
