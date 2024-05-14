require 'system_helper'

RSpec.describe 'Booking system', type: :system, js: true do
  let(:event) { create(:event, :weekend, start_time: Time.now) }
  let(:prayer_vigil) { PrayerVigil.find_by(walk_number: event.walk_number) }

  before do
    visit new_prayer_vigil_booking_path(prayer_vigil)
  end

  it 'creates a new booking with valid credentials' do
    fill_in 'Name', with: 'Test User'
    fill_in 'Email', with: 'test@example.com'

    # Select the first day from the dropdown
    first_day = find('#booking_day option:not([disabled]):not([value=""])', match: :first).text
    select first_day, from: 'Day'

    # Select the first slot from the dropdown
    first_slot = find('#times-select option:not([value=""])', match: :first).text
    select first_slot, from: find('#times-select')['name']

    click_on 'Reserve Slot'

    # expect(page).to have_current_path(prayer_vigils_path)
    expect(page).to have_content('Successfully reserved a slot for the prayer vigil.')
  end

  it 'creates a new booking with invalid credentials' do
    fill_in 'Name', with: ''
    fill_in 'Email', with: ''

    # Select the first day from the dropdown
    first_day = find('#booking_day option:not([disabled]):not([value=""])', match: :first).text
    select first_day, from: 'Day'

    # Select the first slot from the dropdown
    first_slot = find('#times-select option:not([value=""])', match: :first).text
    select first_slot, from: find('#times-select')['name']

    click_on 'Reserve Slot'

    expect(page).to have_current_path(new_prayer_vigil_booking_path(prayer_vigil))
  end
end
