class Publics::ServicesController < ApplicationController

  def index
    @genres = Genre.all
    @services = Service.all
  end

  def show
    @service = Service.find(params[:id])
    @subscribed_item = SubscribedItem.new
  end

  def edit
    @service = Service.find(params[:id])
  end

  def update
    @service = Service.find(params[:id])
    if @service.save
      redirect_to service_path(@service)
    else
      render :edit
    end
  end

  def new
    @service = Service.new(service_params)
  end

  def create
    @service = Service.new(service_params)
    if @service.save
      redirect_to clients_mypage_path
    else
      render :new
    end

    @subscribed_item = SubscribedItem.new(subscribed_item_params)
    @subscribed_item.user_id = current_user.id
    @subscribed_item.save
    # redirect_to users_mypage_path
    # else
    #   redirect_to services_path
    # end

  end

  private

  def service_params
    params.permit(:user_id, :genre_id, :name, :description, :price, :image)
  end

  def subscribed_item_params
    params.require(:subscribed_item).permit(:service_id, :subscribed_price)
  end

end
