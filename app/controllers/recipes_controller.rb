class RecipesController < ApplicationController
  before_action :find_recipe, only: [:show, :edit, :update, :like]
  before_action :require_user, except: [:show, :index]
  before_action :require_same_user, only: [:edit, :update]

  def index
  	@recipes = Recipe.paginate(page: params[:page], per_page: 4)
  end

  def new
  	@recipe = Recipe.new
  end

  def create
  	@recipe = Recipe.new(recipe_params)
  	@recipe.chef = current_user
  	if @recipe.save
  		redirect_to @recipe, notice: "Successfully created..." 
  	else
  		render :new
  	end
  end

  def show	
  end

  def edit
  end

  def update
  	if @recipe.update(recipe_params)
  	  flash[:success] = "Your recipe was updated successfully..."	
  	  redirect_to recipe_path(@recipe)
  	else
      render :edit
  	end
  end

  def like
    like = Like.create(like: params[:like], chef: current_user, recipe: @recipe)
    if like.valid?
      flash[:success] = "Your selections was successful..."
      redirect_to :back
    else
      flash[:danger] = "Your can only like/dislike a recipe once..."
      redirect_to :back
    end 
  end

  private
  	def find_recipe
  	  @recipe = Recipe.find(params[:id])	
  	end

  	def recipe_params
  	  params.require(:recipe).permit(:name, :summary, :description, :picture)
  	end

    def require_same_user
      if current_user != @recipe.chef
        flash[:danger] = "You can only edit your own profile"
        redirect_to :back
      end
    end

end
