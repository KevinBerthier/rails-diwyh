module WorkshopsHelper
  include ActionView::Helpers::AssetUrlHelper

  def workshop_pic(wksp)
    if wksp.photos.present?
      image_path wksp.photos.first.fullpath
    else
      image_path("craftman_avatar.png")
    end
  end
end
