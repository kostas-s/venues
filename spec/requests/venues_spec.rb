require 'rails_helper'

RSpec.describe 'Venues', type: :request do
  describe 'GET venues#index' do
    it 'successful response and content' do
      v = FactoryBot.create(:venue)
      get venues_path
      expect(response).to have_http_status(:ok)
      expect(response.body).to include(v.name)
    end
  end

  describe 'POST venues#create' do
    it 'creates venue and redirects to root path' do
      v = FactoryBot.attributes_for(:venue)
      post venues_path, params: { venue: v }
      expect(response).to redirect_to(root_path)
    end

    it 'does not accept invalid venue and renders errors wrapped in is-invalid' do
      v = FactoryBot.attributes_for(:venue, name: nil)
      post venues_path, params: { venue: v }
      expect(response.body).to include('is-invalid')
      expect(Venue.all.size).to eq(0)
    end
  end

  describe 'GET venues#new' do
    it 'responds successfully' do
      get new_venue_path
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'GET venues#edit' do
    it 'successful response and content' do
      v = FactoryBot.create(:venue)
      get edit_venue_path(id: v.id)
      expect(response).to have_http_status(:ok)
      expect(response.body).to include(
        v.name,
        v.address,
        v.short_description,
        v.long_description,
      )
    end

    it 'responds 404 on invalid id' do
      get edit_venue_path(id: 'NONEXISTENTID')
      expect(response).to have_http_status(404)
    end
  end

  describe 'GET venues#show' do
    it 'responds successfully rendering venue matching id' do
      v = FactoryBot.create(:venue)
      get venue_path(id: v.id)
      expect(response).to have_http_status(:ok)
      expect(response.body).to include(
        v.name,
        v.short_description,
        v.long_description,
        v.address,
        v.lat.to_s,
        v.lng.to_s,
      )
    end

    it 'responds 404 on invalid id' do
      get venue_path(id: 'NONEXISTENT ID')
      expect(response).to have_http_status(404)
    end
  end

  describe 'PUT venues#update' do
    it 'edits successfully and redirects to updated venue' do
      v = FactoryBot.attributes_for(:venue)
      v_record = Venue.create(v)
      v['name'] = 'NEW NAME'
      put venue_path(v_record.id), params: { venue: v }
      expect(response).to redirect_to venue_path(v_record.id)
      follow_redirect!
      expect(response.body).to include('NEW NAME')
    end

    it 'discards edit with invalid value' do
      v = FactoryBot.attributes_for(:venue)
      v_record = Venue.create(v)
      old_name = v_record.name
      v['name'] = ''
      put venue_path(v_record.id), params: { venue: v }
      expect(v_record.name).to eq(old_name)
    end

    it 'responds 404 on invalid id' do
      v = FactoryBot.attributes_for(:venue)
      put venue_path('invalidID'), params: { venue: v }
      expect(response).to have_http_status(404)
    end
  end

  describe 'DELETE venues#destroy' do
    it 'deletes venue given id and redirects to root' do
      v = FactoryBot.create(:venue)
      expect(Venue.all.size).to eq(1)
      delete venue_path(v.id)
      expect(response).to redirect_to root_path
      expect(Venue.all.size).to eq(0)
    end

    it 'responds 404 on invalid id' do
      delete venue_path('invalidID')
      expect(response).to have_http_status(404)
    end
  end
end
