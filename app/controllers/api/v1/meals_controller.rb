class Api::V1::MealsController < ApplicationController
  # protect_from_forgery except: :create
  def index
    render json: Meal.all
  end

  def show
    meal = Meal.find(params[:id])
    render json: meal
  end
end
