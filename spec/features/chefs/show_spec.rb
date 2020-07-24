# Story 3 of 3
# As a visitor
# When I visit a chef's show page
# I see the name of that chef
# And I see a link to view a list of all ingredients that this chef uses in their dishes
# When I click on that link
# I'm taken to a chef's ingredient index page
# and I can see a unique list of names of all the ingredients that this chef uses


require 'rails_helper'

RSpec.describe 'As a visitor' do
  describe 'I visit a chefs show page' do
    it "I see the name of that chef and a link to view a list of all ingredients used in their dishes" do
      chef1 = Chef.create!(name: 'Big Pappa')
      dish1 = Dish.create!(name: 'Cheese Burger', description: '1/2 Pound Angus Beef with American Cheese', chef: chef1)

      ingredient1 = Ingredient.create!(name: "Angus Beef", calories: 200)
      ingredient2 = Ingredient.create!(name: "American Cheese", calories: 50)
      ingredient3 = Ingredient.create!(name: "Wheat Buns", calories: 35)


      visit "/chefs/#{chef1.id}"

      expect(page).to have_content(chef1.name)
      expect(page).to have_link("Chefs Ingredients")
    end

    it "When I click on that link I'm taken to a chef's ingredient index page" do
      chef1 = Chef.create!(name: 'Big Pappa')
      dish1 = Dish.create!(name: 'Cheese Burger', description: '1/2 Pound Angus Beef with American Cheese', chef: chef1)

      ingredient1 = Ingredient.create!(name: "Angus Beef", calories: 200)
      ingredient2 = Ingredient.create!(name: "American Cheese", calories: 50)
      ingredient3 = Ingredient.create!(name: "Wheat Buns", calories: 35)


      visit "/chefs/#{chef1.id}"

      click_link "Chefs Ingredients"

      expect(current_path).to eq("/chefs/#{chef1.id}/ingredients")
    end
  end
end
