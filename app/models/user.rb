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
  enum age: {１９歳未満: 0, ２０代前半: 1, ２０代後半: 2, ３０代前半: 3, ３０代後半: 4, ４０代前半: 5, ４０代後半: 6, ５０代前半: 7, ５０代後半: 8, ６０歳以上: 9}

end
