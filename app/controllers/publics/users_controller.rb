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

  private

  def user_params
    params.require(:user).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :postal_code, :address, :age)
  end

  def outside_item_params
    params.require(:outside_item).permit(:outside_name, :outside_price)
  end

  def total_payment(items)
    sum = 0
    items.each do |item|
      sum += item.subscribed_price
    end
    sum.to_i
  end

  def outside_item_total_payment(items)
    sum = 0
    items.each do |item|
      sum += item.outside_price
    end
    sum.to_i
  end
end