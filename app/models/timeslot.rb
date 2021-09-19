class Timeslot < ApplicationRecord
  belongs_to :venue

  VALID_DAYS = [1, 2, 3, 4, 5, 6, 7].freeze
  validates :day, inclusion: { in: VALID_DAYS }
  validates :start_time, presence: true
  validates :end_time, presence: true
end
