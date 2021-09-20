class Timeslot < ApplicationRecord
  belongs_to :venue

  VALID_DAYS = 0..6
  validates :day, inclusion: { in: VALID_DAYS }
  validates :start_time, presence: true
  validates :end_time, presence: true

  enum day_options: { mon: 0, tue: 1, wed: 2, thu: 3, fri: 4, sat: 5, sun: 6 }
end
