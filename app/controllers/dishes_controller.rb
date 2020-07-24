class DishesController < ApplicationController

  def show
    @dish = Dish.find(params[:id])
    @dish.ingredients << Ingredient.all
  end
end
