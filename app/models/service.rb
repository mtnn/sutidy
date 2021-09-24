class Service < ApplicationRecord

  has_many :users, through: :subscribed_items
  has_many :subscribed_items, dependent: :destroy

  belongs_to :client
  belongs_to :genre

  has_one_attached :image

  enum is_stopped: {承認中: 0, 提供中: 1, 提供停止: 2}

end
