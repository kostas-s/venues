require 'rails_helper'

RSpec.feature 'Timeslots', type: :feature do
  context 'create new timeslot' do
    before(:each) { @venue = FactoryBot.create(:venue) }

    scenario 'should be successful' do
      visit venue_path(@venue.id)
      within('form') do
        fill_in 'timeslot[start_time]', with: '11:00 AM'
        fill_in 'timeslot[end_time]', with: '12:00 PM'
        select(I18n.t('date.day_names')[1], from: 'timeslot[day]')
      end
      click_button I18n.t('helpers.submit.create', model: Timeslot)
      expect(page).to have_content('Timeslot was successfully created')
    end

    scenario 'should be rejected' do
      visit venue_path(@venue.id)
      within('form') do
        fill_in 'timeslot[start_time]', with: '11:00 AM'
        select(I18n.t('date.day_names')[2], from: 'timeslot[day]')
      end
      click_button I18n.t('helpers.submit.create', model: Timeslot)
      expect(page).to have_content('Timeslot could not be created')
    end
  end

  context 'delete timeslot' do
    scenario 'should be successful' do
      venue = FactoryBot.create(:venue)
      venue.timeslots.create(start_time: '11:50', end_time: '15:00', day: 4)
      visit venue_path(venue.id)
      expect(page).to have_content('11:50')
      click_link 'Delete'
      expect(page).to have_content('Timeslot was successfully deleted')
      expect(page).to_not have_content('11:50')
    end
  end
end
