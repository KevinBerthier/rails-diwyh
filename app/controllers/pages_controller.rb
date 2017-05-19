class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    #@glass = Universe.where(name: 'Glass')
  end
end
