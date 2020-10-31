class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :place
  validates :date, presence: true, uniqueness: { scope: :place }
end
