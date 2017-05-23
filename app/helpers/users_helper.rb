module UsersHelper
  include ActionView::Helpers::AssetUrlHelper

  def user_avatar(user)
    if user.avatar.present?
      image_path user.avatar.fullpath
    elsif user.facebook_picture_url.present?
      image_path user.facebook_picture_url
    else
      image_path("user_avatar.png")
    end
  end
end
