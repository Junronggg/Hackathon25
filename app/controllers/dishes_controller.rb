class DishesController < ApplicationController
    def home
    end
  
    def random
      @dish = Dish.order('RANDOM()').first
    end
  
    def by_ingredients
        # Ensure that ingredients are passed in the correct format
        ingredients = params[:ingredients] || [] # Default to empty array if no ingredients selected
        
        if ingredients.any?
          # Find dishes with the selected ingredients
          @dishes = Dish.joins(:ingredients)
                        .where(ingredients: { name: ingredients })
                        .distinct
        else
          @dishes = []
        end
        
        # Fetch all ingredients for the form
        @ingredients = Ingredient.all
      end
  end
  