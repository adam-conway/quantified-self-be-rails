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
    food = Food.new(food_params)
    if food.save
      render json: food
    else
      render json: { message: "Sry plz try again"}, status: 400
    end
  end

  def update
    food = Food.find_by_id(params[:id])
    if food.nil?
      render json: { message: "Sry plz try again"}, status: 400
    else
      food.update(food_params)
    end
  end

  def destroy
    food = Food.find_by_id(params[:id])
    if food.nil?
      render json: { message: "Sry plz try again"}, status: 404
    else
      food.destroy and return 204
    end
  end

  private
    def food_params
      params.require(:food).permit(:name, :calories)
    end

end
