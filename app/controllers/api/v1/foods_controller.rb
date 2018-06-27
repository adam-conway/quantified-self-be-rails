class Api::V1::FoodsController < ApplicationController
  # protect_from_forgery except: :create

  def index
    render json: Food.all
  end

  def show
    food = Food.find(params[:id])
    render json: food
  end

  def create
    food = Food.create(food_params)
    render json: food
  end

  private
    def food_params
      params.require(:food).permit(:name, :calories)
    end

end
