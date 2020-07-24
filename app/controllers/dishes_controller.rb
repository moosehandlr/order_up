class DishesController < ApplicationController

  def show
    @dish = Dish.find(params[:id])
    @dish.ingredients << Ingredient.all
    @total_calories = Ingredient.sum(:calories)
  end
end
