class RecipesController < ApplicationController
  def show
    @recipe = Recipe.find(params[:id])
  end

  def index
    @recipes = Recipe.all
  end

  def new
    @recipe = Recipe.new
    @recipe = ingredients.build(:name: 'water')
      @recipe = ingredients.build(:name: 'milk')


  end

  def create
    Recipe.creat(recipe_params)
    redirect_to recipes_path
  end


  private

  def recipe_params
    params.require(:recipet).permit(
    :title,
    :ingredients_attributes:[
      :name,
      :quantity
    ]
    )
  end

end
