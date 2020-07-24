require 'rails_helper'

RSpec.describe 'As a visitor' do
  describe 'I visit a dishes show page' do
    it "I see a list of ingredients for that dish and the chef's name" do
      chef1 = Chef.create!(name: 'Big Pappa')
      dish1 = Dish.create!(name: 'Cheese Burger', description: '1/2 Pound Angus Beef with American Cheese', chef: chef1)

      ingredient1 = Ingredient.create!(name: "Angus Beef", calories: 200)
      ingredient2 = Ingredient.create!(name: "American Cheese", calories: 50)
      ingredient3 = Ingredient.create!(name: "Wheat Buns", calories: 35)


      visit "/dishes/#{dish1.id}"

      expect(page).to have_content(dish1.name)
      expect(page).to have_content(chef1.name)
      expect(page).to have_content(ingredient1.name)
      expect(page).to have_content(ingredient2.name)
      expect(page).to have_content(ingredient3.name)
    end
  end
end
