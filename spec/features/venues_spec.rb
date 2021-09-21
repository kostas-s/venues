require 'rails_helper'

RSpec.feature 'Venues', type: :feature do
  context 'create new venue' do
    before(:each) do
      visit new_venue_path
      within('form') do
        fill_in 'venue[short_description]', with: 'hey'
        fill_in 'venue[long_description]', with: 'hey'
        fill_in 'venue[address]', with: 'hey'
        fill_in 'venue[lat]', with: '10.5333'
        fill_in 'venue[lng]', with: '10.2525'
      end
    end
    scenario 'should be successful' do
      within('form') { fill_in 'venue[name]', with: 'john' }
      click_button 'Create Venue'
      expect(page).to have_content('Venue was successfully created')
    end

    scenario 'should fail' do
      click_button 'Create Venue'
      expect(page).to have_content('Name can\'t be blank')
    end
  end

  context 'update venue' do
    before(:each) do
      @venue = FactoryBot.create(:venue)
      visit edit_venue_path(@venue)
    end

    scenario 'should be successful' do
      within('form') { fill_in 'venue[name]', with: '15151' }
      click_button 'Update Venue'
      expect(page).to have_content('Venue was successfully updated')
    end

    scenario 'should fail' do
      within('form') { fill_in 'venue[name]', with: '' }
      click_button 'Update Venue'
      expect(page).to have_content('Name can\'t be blank')
    end
  end

  context 'destroy venue' do
    scenario 'should be successful' do
      v = FactoryBot.create(:venue)
      visit venues_path
      expect(page).to have_content(v.name)
      click_link 'Delete'
      expect(page).to have_content('Venue was successfully deleted')
      expect(page).to_not have_content(v.name)
    end
  end
end
