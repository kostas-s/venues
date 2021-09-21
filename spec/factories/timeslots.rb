# == Schema Information
#
# Table name: timeslots
#
#  id         :uuid             not null, primary key
#  venue_id   :uuid             not null
#  start_time :time             not null
#  end_time   :time             not null
#  day        :integer          default(0)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
FactoryBot.define do
  factory :timeslot do
    start_time { '11:50' }
    end_time { '13:40' }
    day { rand(0..6) }
  end
end
