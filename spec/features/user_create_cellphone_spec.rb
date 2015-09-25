require 'rails_helper'

feature 'user adds cellphone', %Q{
  As a used cellphone salesperson
  I want to record a newly acquired cellphone
  So that I can list it in my store
} do

  # Acceptance Criteria:
    # * I must specify the cell phone manufacturer, year and battery life
    #   (an association between the phone and an existing
    #   manufacturer should be created).
    # * Only years from 2003 and above can be addedd.
    # * I can optionally specify a description of the phone.
    # * If I enter all of the required information in the required formats,
    #   the phone is recorded and I am presented with a notification of success
    # * If I do not specify all of the required information in the required
    #   formats, the phone is not recorded and I am presented with errors.
    # * Upon successfully creating a phone, I am redirected back
    #   to the index of phones.

  context 'add a new cell phone' do
    scenario 'entry is valid' do
      manufacturer = FactoryGirl.create(:manufacturer)

      visit new_cell_phone_path

      select('Nokia', :from => 'cell_phone[manufacturer_id]')

      fill_in 'cell_phone[year]', with: '2004'
      fill_in 'cell_phone[battery_life]', with: 'lots'

      click_button 'Submit'

      expect(page).to have_content('New cell phone added')
      expect(page).to have_content('Nokia')

      expect(cell_phones_path(@cell_phone)).to eq(current_path)
    end

    scenario 'entry is invalid' do
      visit new_cell_phone_path

      click_button 'Submit'

      expect(page).to have_content("Year can't be blank.")
      expect(page).to have_content("Battery life can't be blank")
      expect(page).to_not have_content('Nokia')

      expect(cell_phones_path).to eq(current_path)
    end

    scenario 'optionally specify description' do
      manufacturer = FactoryGirl.create(:manufacturer)

      visit new_cell_phone_path

      select('Nokia', :from => 'cell_phone[manufacturer_id]')
      fill_in 'cell_phone[year]', with: '2004'
      fill_in 'cell_phone[battery_life]', with: 'lots'
      fill_in 'cell_phone[description]', with: 'awesomeness'

      click_button 'Submit'

      expect(page).to have_content('New cell phone added')
      expect(page).to have_content('Nokia')

      expect(cell_phones_path(@cell_phone)).to eq(current_path)
    end
  end
end
