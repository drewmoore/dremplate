class GraphicsController < ApplicationController
  def index
    @graphics = Graphic.all
  end

  def new
    @graphic = Graphic.new
  end

  def create
    @graphic = Graphic.new(graphic_params)
    if @graphic.save
      flash[:notice] = "Graphic with identifier #{@graphic.identifier} has been created"
      redirect_to graphics_path
    else
      render "new"
    end
  end

  def destroy
    @graphic = Graphic.find(params[:id])
    identifier = @graphic.identifier
    if @graphic.destroy
      flash[:notice] = "The graphic with identifier #{identifier} has been deleted."
      redirect_to graphics_path
    else
      flash[:notice] = "The graphic with identifier #{identifier} could not be deleted."
      redirect_to graphics_path
    end
  end

  private

  def graphic_params
    params.require(:graphic).permit(:identifier, :image)
  end
end
