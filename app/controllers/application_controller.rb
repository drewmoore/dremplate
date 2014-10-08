class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :get_pages

  def after_sign_in_path_for user
    controls_path
  end

  def get_pages
    if session
      @pages = Page.all
    end
  end

end
