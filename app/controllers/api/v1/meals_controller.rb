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
end
