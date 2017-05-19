class Bus < ApplicationRecord
  has_many :bus_user_tickets
  has_many :users, through: :bus_user_tickets

  validates :start_place, :end_place, :start_at, :end_at, :number_of_seats, presence: true

  def self.start_place_list
    pluck(:start_place).uniq
  end
end
