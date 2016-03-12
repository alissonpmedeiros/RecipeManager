class RemoveSumaryFromRecipes < ActiveRecord::Migration
  def change
    remove_column :recipes, :sumary, :text
  end
end
