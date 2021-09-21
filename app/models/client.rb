class Client < ApplicationRecord

  has_many :services
  belongs_to :user

end
