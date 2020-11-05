class Place < ApplicationRecord
  has_many :bookings
  has_many_attached :photos
  include PgSearch::Model
  pg_search_scope :global_search,
    against: [ :address, :name ],
    associated_against: {
      user: [ :email ]
    },
    using: {
      tsearch: { prefix: true }
    }
end
