class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :name, presence: true
  validates :password, presence: true, length: { minimum: 8 }
  has_many :recipes, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy

  # def liked?(type)
  #   type.likes.include?(Like.find_by(user_id: id, likeable_id: type.id))
  # end

  def liked?(likeable_id)
    likes.include?(Like.find_by(user_id: id, likeable_id: likeable_id))
  end

  def send_devise_notification(notification, *args)
    devise_mailer.send(notification, self, *args).deliver_later
  end
end
