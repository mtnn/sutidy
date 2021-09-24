class Publics::ClientsController < ApplicationController

  def mypage
    @services = current_user.client.services
  end

  def show
    @service = Service.find(params[:id])
    @subscribed_numbers = @service.subscribed_item
  end

  def edit
  end

  def update
  end

end
