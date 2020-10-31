class Place < ApplicationRecord
  has_many :bookings
  has_many_attached :photos
end
