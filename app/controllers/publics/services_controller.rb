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
    if @service.update(edit_service_params)
      redirect_to service_path(@service.id)
    else
      render :edit
    end
  end

  def new
    @service = Service.new
  end

  def create
    @service = Service.new(services_params)
    @service.client_id = current_user.client.id
    @service.is_stopped = 0
    if @service.save
      redirect_to clients_mypage_path
    else
      render :new
    end
  end

  def subscribe
    @subscribed_item = SubscribedItem.new(subscribed_item_params)
    @subscribed_item.user_id = current_user.id
    @subscribed_item.save
    redirect_to users_mypage_path
  end

  # def destroy
  #   service = Service.find(params[:id])
  #   service.destroy
  #   redirect_to admins_services_path
  # end

  private

  def services_params
    params.require(:service).permit(:genre_id, :name, :description, :price, :image)
  end

  def subscribed_item_params
    params.require(:subscribed_item).permit(:service_id, :subscribed_price)
  end

  def edit_service_params
    params.require(:service).permit(:name, :description, :image)
  end

end
