class Api::V1::FoodsController < ApplicationController
  # protect_from_forgery except: :create

  def index
    render json: Food.all
  end

  def show
    food = Food.find_by_id(params[:id])
    if food.nil?
      render json: { message: "Couldn't find that food, sry"}, status: 404
    else
      render json: food
    end
  end

  def create
    food = Food.create(food_params)
    render json: food
  end

  def update
    food = Food.find(params[:id])
    food.update(food_params)
  end

  def destroy
    food = Food.find(params[:id])
    food.destroy and return 204
  end

  private
    def food_params
      params.require(:food).permit(:name, :calories)
    end

end
