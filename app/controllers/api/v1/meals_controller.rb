class Api::V1::MealsController < ApplicationController
  # protect_from_forgery except: :create
  def index
    render json: Meal.all
  end
end
