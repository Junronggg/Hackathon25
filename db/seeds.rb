# Clear existing data
DishIngredient.destroy_all
Dish.destroy_all
Ingredient.destroy_all

# Create Ingredients
ingredients = %w[Tomato Cheese Chicken Beef Onion Garlic Basil Carrot Potato Eggplant Pepper Spinach Mushroom]
ingredient_records = ingredients.map { |name| Ingredient.create!(name: name) }

# Create Dishes
dishes = [
  { name: 'Tomato Basil Soup', video_url: 'https://www.example.com/tomato_basil_soup', ingredients: %w[Tomato Basil Onion Garlic] },
  { name: 'Cheese Omelette', video_url: 'https://www.example.com/cheese_omelette', ingredients: %w[Cheese Eggplant Onion] },
  { name: 'Beef Stew', video_url: 'https://www.example.com/beef_stew', ingredients: %w[Beef Carrot Potato Onion] },
  { name: 'Chicken Salad', video_url: 'https://www.example.com/chicken_salad', ingredients: %w[Chicken Spinach Mushroom] },
  { name: 'Garlic Bread', video_url: 'https://www.example.com/garlic_bread', ingredients: %w[Garlic Basil] },
  { name: 'Vegetable Stir Fry', video_url: 'https://www.example.com/vegetable_stir_fry', ingredients: %w[Carrot Pepper Spinach Onion Mushroom] },
]

dishes.each do |dish_data|
  dish = Dish.create!(name: dish_data[:name], video_url: dish_data[:video_url])
  dish_data[:ingredients].each do |ingredient_name|
    ingredient = Ingredient.find_by(name: ingredient_name)
    DishIngredient.create!(dish: dish, ingredient: ingredient)
  end
end

puts "Seed data created successfully!"
