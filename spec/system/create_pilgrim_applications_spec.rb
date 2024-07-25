require 'system_helper'

RSpec.describe "CreatePilgrimApplications", type: :system, js: true do
  before do
    visit new_pilgrim_application_path
  end

  describe "create pilgrim application" do
    it "successfully creates application" do
      fill_in "First name", with: "Test"
      fill_in "Last name", with: "Name"
      page.execute_script("document.querySelector('#pilgrim_application_pilgrims_attributes_0_date_birth').value = '1950-01-01'")
      select('Male', from: 'Gender')

      fill_in "pilgrim_application_pilgrims_attributes_0_street_address", with: "123 Street St"
      fill_in "pilgrim_application_pilgrims_attributes_0_city", with: "City"
      fill_in "pilgrim_application_pilgrims_attributes_0_state", with: "NC"
      fill_in "pilgrim_application_pilgrims_attributes_0_zipcode", with: "12345"
      fill_in "pilgrim_application_pilgrims_attributes_0_primary_phone", with: "910-555-1212"

      select('Yes', from: 'pilgrim_application_pilgrims_attributes_0_medication_time')
      select('Yes', from: 'Has the purpose of the Walk been explained to you?')
      select('Yes', from: 'Has your sponsor discussed follow-up activities?')
      select('Yes', from: 'Can you attend the Walk on short notice if you are placed on a waitlist?')

      fill_in "pilgrim_application_sponsors_attributes_0_name", with: "John Doe"
      fill_in "pilgrim_application_sponsors_attributes_0_primary_phone", with: "910-555-1212"
      fill_in "pilgrim_application_sponsors_attributes_0_email", with: "email@example.com"
      fill_in "Church reunion", with: "church name"

      select('Yes', from: 'Able to manage climbing a flight of stairs?')
      select('Yes', from: 'Would be more comfortable walking the ramp?')
      select('Yes', from: 'Requires a wheel chair?')
      select('Yes', from: 'Will need a handicap shower?')
      select('Yes', from: 'Could your Pilgrim manage a top bunk in a pinch?')

      select('Yes', from: 'Have you reviewed the Steps to good sponsorship?')
      select('Yes', from: 'Understand that you are responsible for getting the Pilgrim to the Walk and back home?')
      select('Yes', from: 'Must collect a minimum of 12 letters?')
      select('Yes', from: 'Must attend Registration, Sendoff and Sponsor’s Hour, Candlelight, and Closing for your Pilgrim?')
      select('Yes', from: 'Will help your Pilgrim attend the Follow-up meeting?')

      click_button 'Submit Application'
      expect(page).to have_text 'Pilgrim application submitted successfully.'
    end

    it "fails to create application" do
      fill_in "Last name", with: "Name"
      page.execute_script("document.querySelector('#pilgrim_application_pilgrims_attributes_0_date_birth').value = '1950-01-01'")
      select('Male', from: 'Gender')
      click_button 'Submit Application'
      expect(page).to have_text 'First Name can\'t be blank'
    end
  end
end
