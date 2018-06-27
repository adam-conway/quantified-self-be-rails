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

  it "sends a 404 if food not found" do
    get "/api/v1/foods/1"

    expect(response.successful?)
    api_food = JSON.parse(response.body)

    expect(response.status).to eq(404)
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

  it "patching a food" do
    food = create(:food)
    params = { "food": { "name": "Mint", "calories": "14"} }
    patch "/api/v1/foods/#{food.id}", params: params

    expect(response.successful?)

    updated = Food.last

    expect(updated.id).to eq(food.id)
    expect(updated.name).to_not eq(food.name)
  end

  it "deletes a food from DB and returns 204" do
    food = create(:food)
    expect(Food.count).to eq(1)

    delete "/api/v1/foods/#{food.id}"

    expect(response.successful?)
    expect(response.status).to eq(204)

    expect(Food.count).to eq(0)
  end
end
