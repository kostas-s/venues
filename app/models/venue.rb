class Venue < ApplicationRecord
  validates :name, presence: true, length: { maximum: 25 }
  validates :short_description, presence: true, length: { maximum: 50 }
  validates :long_description, presence: true, length: { maximum: 500 }
  validates :address, presence: true, length: { maximum: 50 }
  validates :lat, presence: true, length: { maximum: 15 }, numericality: true
  validates :lng, presence: true, length: { maximum: 15 }, numericality: true

  has_many :timeslots, dependent: :destroy
  has_many_attached :images
  validate :image_type

  private

  def image_type
    images.each do |image|
      if !image.content_type.in?("'image/jpeg image/png'")
        errors.add(:images, 'only accepts JPEG or PNG files')
      end
    end
  end
end
