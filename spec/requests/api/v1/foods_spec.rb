require 'rails_helper'

describe "Foods API" do
  it "sends a list of foods" do
    food_list = create_list(:food, 5)
    get '/api/v1/foods'
    expect(response.successful?)
    foods = JSON.parse(response.body)

    expect(foods.count).to eq(food_list.count)
  end

  it "sends a single food based on id number" do
    food = create(:food)
    get "/api/v1/foods/#{food.id}"

    expect(response.successful?)
    api_food = JSON.parse(response.body)

    expect(food.id).to eq(api_food["id"])
  end

  it "creates a new of food" do
    params = {food: {:name => "Test", :calories => 1500}}
    post "/api/v1/foods", params: params
    expect(response.successful?)

    expect(Food.count).to eq(1)

    params = {food: {:name => "Again", :calories => 234}}
    post "/api/v1/foods", params: params
    expect(response.successful?)

    expect(Food.count).to eq(2)
  end
end
