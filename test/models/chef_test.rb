require 'test_helper'

class ChefTest < ActiveSupport::TestCase
	def setup
		@chef = Chef.new(chefname: "mono", email: "xuantruong1234@gmail.com")
	end

	test "chef should be valid" do
		assert @chef.valid?
	end
end