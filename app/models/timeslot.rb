class Timeslot < ApplicationRecord
  belongs_to :venue

  VALID_DAYS = [1, 2, 3, 4, 5, 6, 7].freeze
  validates :day, inclusion: { in: VALID_DAYS }
  validates :start_time, presence: true
  validates :end_time, presence: true

  enum day: { mon: 1, tue: 2, wed: 3, thu: 4, fri: 5, sat: 6, sun: 7 }
end
