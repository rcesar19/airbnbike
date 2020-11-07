class Place < ApplicationRecord
  include PgSearch::Model
  has_many :bookings
  has_many_attached :photos
  # validates :price, presence: true

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  pg_search_scope :global_search,
    against: [ :address, :name ],
    using: {
      tsearch: { prefix: true }
    }
end
