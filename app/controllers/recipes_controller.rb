include ActionView::Helpers::DateHelper
class RecipesController < ApplicationController
	def index
		@recipes = Recipe.all
	end
	
	
end