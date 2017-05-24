require 'test_helper'


class UsersHelperTest < ActiveSupport::TestCase
  include UsersHelper

  test "avatar returns the best avatar for an user" do
    fb_picture_url = "http://facebook.com/picture.png"

    user = User.new(facebook_picture_url: fb_picture_url)
    assert_equal fb_picture_url, avatar(user)


    user = User.new
    assert avatar(user).start_with?("/images/")
  end
end
