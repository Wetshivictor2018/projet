class User < ApplicationRecord
  
  has_one_attached :avatar

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_one :cart, dependent: :destroy
  has_many :formations, dependent: :destroy
  has_many :orders, dependent: :destroy


  after_create :create_cart

  def create_cart
    Cart.create!(user_id: self.id)
  end

  after_create :welcome_send

  def welcome_send
    UserMailer.welcome_email(self).deliver_now
  end
end
