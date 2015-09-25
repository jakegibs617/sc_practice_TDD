require 'rails_helper'

feature 'user adds manufacturer', %Q{
  As a used cellphone salesperson
  I want to record a cellphone manufacturer
  So that I can keep track of the types of cellphones sold in my store
  } do

  # Acceptance Criteria:
    # * I must specify a manufacturer name and country.
    # * If I do not specify the required information,
    #   I am presented with errors.
    # * If I specify the required information,
    #   the manufacturer is recorded
    #   and I am redirected to the index of manufacturers

  context 'enter a new manufacturer' do
    scenario 'entry is valid' do
      visit new_manufacturer_path

      fill_in 'manufacturer[name]', with: 'Nokia'
      fill_in 'manufacturer[country]', with: 'USA'

      click_button 'Submit'

      expect(page).to have_content('New manufacturer added')
      expect(page).to have_content('Nokia')

      expect(manufacturers_path(@manufacturer)).to eq(current_path)
    end

    scenario 'entry is invalid' do
      visit new_manufacturer_path

      click_button 'Submit'
      expect(page).to have_content("Name can't be blank.")
      expect(page).to have_content("Country can't be blank")
      expect(page).to_not have_content('Nokia')

      expect(manufacturers_path).to eq(current_path)
    end
  end
end
