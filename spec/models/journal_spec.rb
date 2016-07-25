require 'rails_helper'

RSpec.describe Journal, type: :model do
    it { should validate_uniqueness_of(:name).case_insensitive }
    it { should validate_presence_of(:name) }

    it {should have_many(:publications)}
end
