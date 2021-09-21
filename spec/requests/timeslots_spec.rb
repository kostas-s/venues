require 'rails_helper'

RSpec.describe 'Timeslots', type: :request do
  describe 'POST timeslots#create' do
    before(:each) { @venue = FactoryBot.create(:venue) }

    it 'should create valid timeslot' do
      t = FactoryBot.attributes_for(:timeslot)
      post venue_timeslots_path(@venue.id), params: { timeslot: t }
      follow_redirect!
      expect(response.body).to include(t[:start_time], t[:end_time])
      expect(response.body).to include('Timeslot was successfully created')
    end

    it 'should reject invalid timeslot' do
      t = FactoryBot.attributes_for(:timeslot, day: 9)
      post venue_timeslots_path(@venue.id), params: { timeslot: t }
      follow_redirect!
      expect(response.body).to include('Timeslot could not be created')
    end
  end

  describe 'DELETE timeslots#destroy' do
    before(:each) { @venue = FactoryBot.create(:venue) }

    it 'should delete timeslot' do
      t = @venue.timeslots.create(FactoryBot.attributes_for(:timeslot))
      expect(Timeslot.all.size).to eq(1)
      delete venue_timeslot_path(venue_id: @venue.id, id: t.id)
      expect(Timeslot.all.size).to eq(0)
      follow_redirect!
      expect(response.body).to include('Timeslot was successfully deleted')
    end
  end
end
