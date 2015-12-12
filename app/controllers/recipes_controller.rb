include ActionView::Helpers::DateHelper
class RecipesController < ApplicationController
	def index
		@recipes = Recipe.paginate(page: params[:page], per_page: 6)
	end

	def show
		@recipe = Recipe.find( params[:id] )
	end

	def new
		#binding.pry
		@recipe = Recipe.new
	end
	
	def create
		#binding.pry
		@recipe = Recipe.new( recipe_params )
		@recipe.chef = Chef.find(1)
		if @recipe.save
			flash[:success] = "Created a new Recipe"
			redirect_to recipes_path
		else
			render :new
		end
	end

	def edit
		@recipe = Recipe.find( params[:id] )
	end

	def update
		@recipe = Recipe.find( params[:id] )
		if @recipe.update( recipe_params )
			flash[:success] = 'Recipe was updated success'
			redirect_to recipe_path( @recipe )
		else
			render :edit
		end
	end

	def like
		@recipe = Recipe.find( params[:id] )
		@like = Like.create( like: params[:like], chef: Chef.first, recipe: @recipe)
		if @like.valid?
			flash[:success] = "Your selection was successful"
		else 
			flash[:danger] = "You only choose once"
		end
		redirect_to :back
	end
	
	private
		def recipe_params
			params.require(:recipe).permit(:name, :summary, :description, :picture)
		end
end