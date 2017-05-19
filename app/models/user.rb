class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  enum role: { user: 0, admin: 1 }

  has_many :bus_user_tickets
  has_many :buses, through: :bus_user_tickets
end
