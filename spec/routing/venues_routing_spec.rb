require 'rails_helper'

RSpec.describe 'routes for Venues', type: :routing do
  it 'routes /venues to the venues controller' do
    expect(get: '/venues').to route_to(controller: 'venues', action: 'index')
  end

  it 'routes /venues/:id to show action' do
    expect(get: '/venues/random_id111').to route_to(
      controller: 'venues',
      action: 'show',
      id: 'random_id111',
    )
  end

  it 'routes /venues/new to new action' do
    expect(get: '/venues/new').to route_to(controller: 'venues', action: 'new')
  end

  it 'routes /venues/:id/edit to edit action' do
    expect(get: '/venues/random_id_oneone/edit').to route_to(
      controller: 'venues',
      action: 'edit',
      id: 'random_id_oneone',
    )
  end

  it 'routes put request on /venues/:id to update action' do
    expect(put: '/venues/random_id').to route_to(
      controller: 'venues',
      action: 'update',
      id: 'random_id',
    )
  end

  it 'routes delete request on /venues/:id to destroy action' do
    expect(delete: '/venues/random_id').to route_to(
      controller: 'venues',
      action: 'destroy',
      id: 'random_id',
    )
  end

  it 'routes post request on /venues to create action' do
    expect(post: '/venues').to route_to(controller: 'venues', action: 'create')
  end
end
