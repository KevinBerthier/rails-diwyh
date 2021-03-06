class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!

  private
  def disable_nav
   @disable_nav = true
  end

  def default_url_options
    { host: ENV["HOST"] || "localhost:3000" }
  end
end
