class Admins::ServicesController < ApplicationController

  def index
    @services = Service.all
  end

  def update
    @service = Service.find(params[:id])
    @service.update(update_service_status_params)
    redirect_to admins_services_path
  end

  def destroy
    service = Service.find(params[:id])
    service.destroy
    redirect_to admins_services_path
  end

  private

  def update_service_status_params
    params.require(:service).permit(:is_stopped)
  end

end
