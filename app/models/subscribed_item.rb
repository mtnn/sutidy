class SubscribedItem < ApplicationRecord

  belongs_to :user
  belongs_to :service

  enum payment_status: {未請求: 0, 請求済み: 1}

end
