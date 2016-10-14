require 'test_helper'

class UserTest < ActiveSupport::TestCase
	def setup
		@user = User.new(name: "Bryan Woodhams", email: "test@test.com",
										 password: "foobarbaz", password_confirmation: "foobarbaz")

	end

	test "should be valid" do
		assert @user.valid?
	end

	test "name is required" do 
		@user.name = "    "
		assert_not @user.valid?
	end

	test "email required" do
		@user.email = "  "
		assert_not @user.valid?
	end

	test "name limit" do
		@user.name = "A" * 51
		assert_not @user.valid?
	end

	test "email limit" do
		@user.email = "A" * 244 + "@example.com"
		assert_not @user.valid?
	end

	test "email validation accept valid" do
    valid_addresses = %w[user@example.com USER@foo.COM A_US-ER@foo.bar.org
                         first.last@foo.jp billy+bob@baz.cn]
    valid_addresses.each do |valid_address|
      @user.email = valid_address
      assert @user.valid?, "#{valid_address.inspect} should be valid"
    end
  end

  test "email validation reject invalid" do
    invalid_addresses = %w[user@example,com user_at_foo.org user.name@example.
                           foo@bar_baz.com foo@bar+baz.com]
    invalid_addresses.each do |invalid_address|
      @user.email = invalid_address
      assert_not @user.valid?, "#{invalid_address.inspect} should be invalid"
    end
  end

  test "email addresses should be unique" do
    duplicate_user = @user.dup
    @user.save
    assert_not duplicate_user.valid?
  end

  test "authenticated? should return false for a user with nil digest" do
    assert_not @user.authenticated?(:remember, '')
  end

end
