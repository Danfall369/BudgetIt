require 'rails_helper'

RSpec.feature 'Splash page', type: :feature do
  scenario 'User can see the text and action buttons' do
    # Visit the splash page
    visit root_path

    # Check if the text is displayed
    expect(page).to have_content('Budget It!')

    # Check if the "SIGN UP" button is present
    expect(page).to have_button('SIGN UP')

    # Check if the "LOG IN" button is present
    expect(page).to have_button('LOG IN')
  end
end
