require 'rails_helper'

describe "Foods API" do
  it "sends a list of foods" do
    food_list = create_list(:food, 5)
    get '/api/v1/foods'
    expect(response.successful?)
    foods = JSON.parse(response.body)

    expect(foods.count).to eq(food_list.count)
  end

  it "creates a new of food" do
    params = {food: {:name => "Test", :calories => 1500}}
    post "/api/v1/foods", params: params, headers: headers
    expect(response.successful?)
    foods = JSON.parse(response.body)
  end
end
