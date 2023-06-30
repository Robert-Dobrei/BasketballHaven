class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_one :address
  has_one :credit_card
  accepts_nested_attributes_for :address
  has_many :orders
  has_one_attached :image

  def admin?
    self.role == "admin"
  end
end
