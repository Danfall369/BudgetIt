require 'rails_helper'

RSpec.describe 'serviceIndex', type: :system do
  before(:each) do
    driven_by(:rack_test)
    @user = User.create!(name: 'John', email: 'testing@ruby.com',
                         password: 'password', admin: false)
    @service = Service.create!(name: 'Test service', icon: 'icon1.svg', author_id: @user.id)

    visit new_user_session_path

    fill_in 'E-mail', with: @user.email
    fill_in 'Password', with: 'password'
    click_button 'Log in'

    visit services_path(@user.id)
  end

  it 'displays the service name' do
    expect(page).to have_css('.service-info')
  end

  it 'displays the service icon' do
    expect(page).to have_css('.service-image')
  end

  it 'displays the name of the service' do
    expect(page).to have_content('Test service')
  end

  it 'displays the creation date of the service' do
    expect(page).to have_css('.service-info')
  end

  it 'displays the total amount of the transactions' do
    expect(page).to have_css('.service-total-amount')
  end
end