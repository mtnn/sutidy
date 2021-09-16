class Service < ApplicationRecord

  has_one_attached :image

  def service_params
    params.require(:service).permit(:image)
  end

end
