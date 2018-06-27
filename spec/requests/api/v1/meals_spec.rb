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
end
