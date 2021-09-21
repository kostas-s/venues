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
require 'rails_helper'

RSpec.describe Timeslot, type: :model do
  describe 'associations' do
    # requires gem shoulda-matchers
    it { should belong_to(:venue) }
  end

  describe 'happy path' do
    before(:each) { @venue = FactoryBot.create(:venue) }

    it 'saves valid timeslot' do
      t = @venue.timeslots.build(FactoryBot.attributes_for(:timeslot))
      expect(t.save).to be(true)
    end
  end

  describe 'validations' do
    before(:each) { @venue = FactoryBot.create(:venue) }
    it 'rejects orphan timeslot' do
      t = FactoryBot.build(:timeslot)
      expect(t).to_not be_valid
    end

    it 'rejects invalid day' do
      t = @venue.timeslots.build(FactoryBot.attributes_for(:timeslot, day: 8))
      expect(t).to_not be_valid
    end

    it 'rejects invalid start time' do
      t =
        @venue.timeslots.build(
          FactoryBot.attributes_for(:timeslot, start_time: '26:30'),
        )
      expect(t).to_not be_valid
    end

    it 'rejects invalid end time' do
      t =
        @venue.timeslots.build(
          FactoryBot.attributes_for(:timeslot, end_time: 'ab:be'),
        )
      expect(t).to_not be_valid
    end
  end
end
