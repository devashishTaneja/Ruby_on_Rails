require "test_helper"

class UserTest < ActiveSupport::TestCase
	# test "the truth" do
	#   assert true
	# end

	# Runs before each test
	def setup
		@user = User.new(name: "Example User", email: "user@example.com",password: "foobar", password_confirmation: "foobar")
	end

	test "should be valid" do
		assert @user.valid?
	end

	test "name should not be too long" do
		@user.name = "a" * 51
		assert_not @user.valid?
	end

	test "email should not be too long" do
		@user.email = "a" * 51
		assert_not @user.valid?
	end

	test "should be valid email" do
		@user.email = "abc"
		assert_not @user.valid?
	end

	test "email addresses should be unique" do
		# This comes from user validation in model user not database index constraint
		duplicate_user = @user.dup
		@user.save
		assert_not duplicate_user.valid?
	end
end
