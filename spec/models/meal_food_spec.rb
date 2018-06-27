require 'rails_helper'

RSpec.describe MealFood, type: :model do
  # describe 'Field validations' do
  #   it { should validate_presence_of(:name) }
  #   it { should validate_presence_of(:calories) }
  # end

  describe 'relationships' do
    it { should belong_to(:meal) }
    it { should belong_to(:food) }
  end
end
