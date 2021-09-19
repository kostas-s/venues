class Venue < ApplicationRecord
  validates :name, presence: true, length: { maximum: 25 }
  validates :short_description, presence: true, length: { maximum: 50 }
  validates :long_description, presence: true, length: { maximum: 500 }
  validates :address, presence: true, length: { maximum: 50 }
  validates :lat, presence: true, length: { maximum: 15 }, numericality: true
  validates :lng, presence: true, length: { maximum: 15 }, numericality: true
end
