require 'test_helper'

class RecipeTest < ActiveSupport::TestCase
	def setup
		@chef = Chef.create( chefname: "xuan truong", email: "xuantruong1234@gmail.com")
		@recipe = @chef.recipes.build( name: "recipe name", summary: "recipe summary", description: "description recipeaf")
	end
	test "recipe should be valid" do
		assert @recipe.valid?
	end
	test "name should be present" do
		@recipe.name = " "
		assert_not @recipe.valid?
	end
	test "name should be not too short" do
		@recipe.name = "aa" 
		assert_not @recipe.valid?
	end

	test "name should be not too long" do
		@recipe.name = "a" * 101
		assert_not @recipe.valid?
	end

	test "summary should be present" do
		@recipe.summary = " "
		assert_not @recipe.valid?
	end

	test "summary shoud be not too short" do
		@recipe.summary = "a" * 9
		assert_not @recipe.valid?
	end

	test "description should be present" do
	end

	test "description should be not too short" do
		@recipe.description = "a" * 10
		assert_not @recipe.valid?
	end

	test "chef_id should be present" do
		@recipe.chef_id = nil
		assert_not @recipe.valid?
	end
end