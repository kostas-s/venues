require 'rails_helper'

RSpec.feature 'Venues', type: :feature do
  context 'create new venue' do
    scenario 'should be successful' do
      visit new_venue_path
      within('form') do
        fill_in 'venue[name]', with: 'john'
        fill_in 'venue[short_description]', with: 'hey'
        fill_in 'venue[long_description]', with: 'hey'
        fill_in 'venue[address]', with: 'hey'
        fill_in 'venue[lat]', with: '10.5333'
        fill_in 'venue[lng]', with: '10.2525'
      end
      click_button 'Create Venue'
      expect(page).to have_content('Venue was successfully created')
    end
  end
end
