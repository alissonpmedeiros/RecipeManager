class CreateRecipeStyles < ActiveRecord::Migration
  def change
    create_table :recipe_styles do |t|

      t.timestamps null: false
    end
  end
end
