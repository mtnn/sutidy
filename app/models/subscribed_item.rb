class SubscribedItem < ApplicationRecord

  belongs_to :user
  belongs_to :service

  enum payment_status: {未請求: 0, 請求済み: 1}
  enum subscribe_status: {登録中: 0, 解除申請中: 1, 解除済み: 2}

end
