class Ship < ApplicationRecord
  belongs_to :user
  has_one_attached :picture
  has_many :bookings
  has_many :reviews, through: :bookings
end
