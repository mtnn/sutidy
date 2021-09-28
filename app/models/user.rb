class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one :client
  has_many :services, through: :subscribed_items
  has_many :subscribed_items, dependent: :destroy
  has_many :outside_items, dependent: :destroy

  enum gender: {男性: 0, 女性: 1}
  enum age: {１９歳未満: 0, ２０代: 1, ３０代: 2, ４０代: 3, ５０代以上: 4}

end
