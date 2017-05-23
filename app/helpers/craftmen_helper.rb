module CraftmenHelper
  include ActionView::Helpers::AssetUrlHelper

  def craftman_avatar(user)
    if user.avatar.present?
      image_path user.avatar.fullpath
    else
      image_path("craftman_avatar.png")
    end
  end
end
