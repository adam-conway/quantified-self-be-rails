require 'rails_helper'

describe "Foods API" do
  it "sends a list of meals" do
    food_list = create_list(:food, 10)
    Meal.create(name: "Breakfast")
    Meal.create(name: "Snacks")
    Meal.create(name: "Lunch")
    Meal.create(name: "Dinner")

    Meal.all.each do |meal|
      4.times do
        meal.meal_foods.create(food_id: food_list.sample.id)
      end
    end

    get '/api/v1/meals'
    expect(response.successful?)
    meals = JSON.parse(response.body)

    expect(meals.count).to eq(4)
    expect(meals[0]["foods"].count).to eq(4)
    expect(meals[1]["foods"].count).to eq(4)
    expect(meals[2]["foods"].count).to eq(4)
    expect(meals[3]["foods"].count).to eq(4)
  end

  it "sends a single meal's foods" do
    brekky = Meal.create(name: "Breakfast")

    4.times do
      brekky.meal_foods.create(food_id: create(:food).id)
    end

    get "/api/v1/meals/#{brekky.id}"
    expect(response.successful?)
    meals = JSON.parse(response.body)

    expect(meals["foods"].count).to eq(4)
  end

  it "fails to send a single meal's foods" do
    get "/api/v1/meals/1"
    expect(response.successful?)
    expect(response.status).to eq(404)
  end

  it "posts a new meal foods" do
    brekky = Meal.create(name: "Breakfast")
    food = create(:food)

    post "/api/v1/meals/#{brekky.id}/foods/#{food.id}"
    expect(response.successful?)
    expect(response.status).to eq(201)
    message = JSON.parse(response.body)

    expect(brekky.foods.count).to eq(1)
    expect(message["message"]).to eq("Successfully added #{food.name} to #{brekky.name}")
  end

  it "fails to posts a new meal foods" do
    brekky = Meal.create(name: "Breakfast")

    post "/api/v1/meals/#{brekky.id}/foods/1"
    expect(response.successful?)
    expect(response.status).to eq(404)

    expect(brekky.foods.count).to eq(0)
  end

  it "deletes a meal foods" do
    brekky = Meal.create(name: "Breakfast")
    food = create(:food)
    brekky.meal_foods.create(food_id: food.id)
    expect(brekky.foods.count).to eq(1)

    delete "/api/v1/meals/#{brekky.id}/foods/#{food.id}"
    expect(response.successful?)
    message = JSON.parse(response.body)

    expect(brekky.foods.count).to eq(0)
    expect(message["message"]).to eq("Successfully removed #{food.name} to #{brekky.name}")
  end
end
