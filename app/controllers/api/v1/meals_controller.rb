class Api::V1::MealsController < ApplicationController
  # protect_from_forgery except: :create
  def index
    render json: Meal.all
  end

  def show
    meal = Meal.find(params[:id])
    render json: meal
  end

  def create
    meal = Meal.find(params[:meal_id])
    food = Food.find(params[:id])
    MealFood.create(food_id: food.id, meal_id: meal.id)
    render json: {"message": "Successfully added #{food.name} to #{meal.name}"}, status: 201
  end

  def destroy
    meal = Meal.find(params["meal_id"])
    food = Food.find(params["id"])
    meal_food = meal.meal_foods.find_by(food_id: food.id)

    meal_food.destroy
    render json: {"message": "Successfully removed #{food.name} to #{meal.name}"}
  end
end
