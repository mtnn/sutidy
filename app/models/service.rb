class Service < ApplicationRecord

  has_many :users, through: :subscribed_items
  has_many :subscribed_items, dependent: :destroy

  belongs_to :client
  belongs_to :genre

  has_one_attached :image

  def service_params
    params.require(:service).permit(:image)
  end

end
