class Publics::UsersController < ApplicationController

  def mypage

  end

  def new_item
  end

  def create
  end

  def destroy
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
end