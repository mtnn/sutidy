class Publics::ServicesController < ApplicationController

  def index
    @genres = Genre.all
    @services = Service.all
  end

  def show
    @service = Service.find(params[:id])
  end

  def edit
  end

  def update
  end
end
