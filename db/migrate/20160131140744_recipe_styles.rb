class RecipeStyles < ActiveRecord::Migration
  def change
  	create_table :recipes_style do |t|
  	  t.integer :style_id, :recipe_id
  	end
  end
end
