class Publics::HomesController < ApplicationController

  def top
    @new_client = Client.new
  end


  def create
    @new_client = Client.new(create_client)
    @new_client.save
    redirect_to clients_mypage_path
  end

  private

  def create_client
  params.require(:client).permit(:user_id)
  end
end
