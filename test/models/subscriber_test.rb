require 'test_helper'

class SubscriberTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  #creating initial valid user model object @user using special setup method. Setup gets run before each test.
  def setup
  	@subscriber = Subscriber.new(email: "rmoran20@uic.edu")
  end

  test "should be valid" do 
  	assert @subscriber.valid?
  end

  test "email should be present" do
  	@subscriber.email = "          "
  	assert_not @subscriber.valid?
  end

  test "email should not be too long" do
  	@subscriber.email = "a" * 244 + "@example.com"
  	assert_not @subscriber.valid?
  end

  test "email validation should accept valid addresses" do
    valid_addresses = %w[user@example.com USER@foo.COM A_US-ER@foo.bar.org
                         first.last@foo.jp alice+bob@baz.cn]
    valid_addresses.each do |valid_address|
      @subscriber.email = valid_address
      assert @subscriber.valid?, "#{valid_address.inspect} should be valid"
    end
  end

  test "email validation should reject invalid addresses" do
    invalid_addresses = %w[user@example,com user_at_foo.org user.name@example.
                           foo@bar_baz.com foo@bar+baz.com]
    invalid_addresses.each do |invalid_address|
      @subscriber.email = invalid_address
      assert_not @subscriber.valid?, "#{invalid_address.inspect} should be invalid"
    end
  end

  test "email addresses should be unique" do
  	duplicate_subscriber = @subscriber.dup
  	duplicate_subscriber.email = @subscriber.email.upcase
  	@subscriber.save
  	assert_not duplicate_subscriber.valid?
  end



end
