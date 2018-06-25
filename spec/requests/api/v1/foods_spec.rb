require 'rails_helper'

describe "Foods API" do
  it "sends a list of foods" do
    food_list = create_list(:food, 5)
    get '/api/v1/foods'
    expect(response).to be_success
    foods = JSON.parse(response.body)

    expect(foods.count).to eq(food_list.count)
  end
end
