class Api::V1::FoodsController < ApplicationController
  # protect_from_forgery except: :create

  def index
    render json: Food.all
  end

  def create
    food = Food.create(name: params[:food][:name], calories: params[:food][:calories].to_i)
    render json: food
  end
end
