class PagesController < ApplicationController
  def index
    @pages = Page.all
  end

  def new
    @page = Page.new
  end

  def create
    @page = Page.new(page_params)
    if @page.save
      flash[:notice] = "The new page has been created for #{page_params[:controller]}##{page_params[:action]}"
      redirect_to pages_path
    else
      render "new"
    end
  end

  private
  def page_params
    params.require(:page).permit(:title, :controller, :action)
  end
end
