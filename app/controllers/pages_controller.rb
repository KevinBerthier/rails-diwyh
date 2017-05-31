class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    @universes = Universe.all
        #geocoder
    @workshops = Workshop.all
    @craftmen = Craftman.where.not(latitude: nil, longitude: nil)
    @hash = Gmaps4rails.build_markers(@workshops) do |workshop, marker|
      marker.lat workshop.craftman.latitude
      marker.lng workshop.craftman.longitude
      marker.infowindow render_to_string(:partial => "/pages/infowindow",  :locals => {:workshop => workshop})

    end
  end
end
