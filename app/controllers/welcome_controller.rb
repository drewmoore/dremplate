class WelcomeController < ApplicationController
  def index
    @page = Page.find_by(controller: params[:controller], action: params[:action])
  end
end
