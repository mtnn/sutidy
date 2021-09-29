class OutsideItem < ApplicationRecord

  belongs_to :user

  enum outside_priority: {有効: 0, 無効: 1}

end
