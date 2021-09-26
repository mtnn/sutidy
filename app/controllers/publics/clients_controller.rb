class Publics::ClientsController < ApplicationController

  def mypage
    @services = current_user.client.services
  end

  def show
    @service = Service.find(params[:id])
    @subscribed_items = @service.subscribed_items.all

    @gender_chart = {'男性' => 0, '女性' => 0}
    @age_chart = {'１９歳未満' => 0, '２０代' => 0, '３０代' => 0, '４０代' => 0, '５０代以上' => 0}
    @subscribed_items.each do |subscribed_item|
      @gender_chart[subscribed_item.user.gender] += 1
      @age_chart[subscribed_item.user.age] += 1
    end
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
