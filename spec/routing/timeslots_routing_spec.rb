require 'rails_helper'

RSpec.describe 'routes for Timeslots', type: :routing do
  it 'routes post request to venues/venue_id/timeslots to timeslot create action' do
    expect(post: '/venues/random_ven_id/timeslots').to route_to(
      controller: 'timeslots',
      venue_id: 'random_ven_id',
      action: 'create',
    )
  end

  it 'routes destroy request to venues/venue_id/timeslots/timeslot_id to timeslot destroy action' do
    expect(
      delete: '/venues/random_ven_id/timeslots/random_timeslot_id',
    ).to route_to(
      controller: 'timeslots',
      venue_id: 'random_ven_id',
      id: 'random_timeslot_id',
      action: 'destroy',
    )
  end
end
