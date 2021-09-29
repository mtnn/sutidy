class Publics::UsersController < ApplicationController

  def mypage
    @items = current_user.subscribed_items.all
    @outside_items = current_user.outside_items.all
    @total_payment = total_payment(@items) + outside_item_total_payment(@outside_items)

    @new_item = OutsideItem.new
  end

  def create
    @new_item = OutsideItem.new(outside_item_params)
    @new_item.user = current_user
    if @new_item.save
      redirect_to users_mypage_path
    else
      @items = current_user.subscribed_items.all
      @outside_items = current_user.outside_items.all
      render :mypage
    end
  end

  def destroy
    outside_item = OutsideItem.find(params[:id])
    outside_item.destroy
    redirect_to users_mypage_path
  end

  def profile
    @user = current_user
  end

  def edit
    @user = current_user
  end

  def update
   @customer = current_user
    if @customer.update(user_params)
     redirect_to users_profile_path
    else
     render :edit
    end
  end

  def change_sub_priority
    subscribed_item = SubscribedItem.find(params[:id])
    subscribed_item.update(change_subscribed_priority)
    redirect_to users_mypage_path
  end

  def change_out_priority
    outside_item = OutsideItem.find(params[:id])
    byebug
    outside_item.update(change_outside_priority)
    redirect_to users_mypage_path
  end

  private

  def user_params
    params.require(:user).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :postal_code, :address, :age)
  end

  def outside_item_params
    params.require(:outside_item).permit(:outside_name, :outside_price)
  end

  def change_subscribed_priority
    params.require(:subscribed_item).permit(:subscribed_priority)
  end

  def chenge_outside_priority
    params.require(:outside_item).permit(:outside_priority)
  end

  def total_payment(items)
    sum = 0
    items.each do |item|
      if item.subscribed_priority == '有効'
        sum += item.subscribed_price
      end
    end
    sum.to_i
  end

  def outside_item_total_payment(items)
    sum = 0
    items.each do |item|
      if item.outside_priority == '有効'
        sum += item.outside_price
      end
    end
    sum.to_i
  end
end