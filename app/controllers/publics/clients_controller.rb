class Publics::ClientsController < ApplicationController

  def mypage
    @services = current_user.client.services
  end

  def show
    @service = Service.find(params[:id])
    @subscribed_numbers = @service.subscribed_items.all
  end

  def update
    @item = SubscribedItem.find(params[:id])
    @item.update(update_status_params)
    redirect_to clients_analytics_path(@item.id)
  end

  private

  def update_status_params
    params.require(:subscribed_item).permit(:payment_status)
  end

end
