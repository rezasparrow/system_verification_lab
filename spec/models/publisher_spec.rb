require 'rails_helper'

RSpec.describe Publisher, type: :model do
    it { should validate_uniqueness_of(:name).case_insensitive }
    it {should have_many(:publications)}
end
