require 'rails_helper'

RSpec.describe 'serviceShow', type: :system do
  before(:each) do
    driven_by(:rack_test)
    @user = User.create!(name: 'John', email: 'testing@ruby.com',
                         password: 'password', admin: false)
    @service = Service.create!(name: 'Test service', icon: 'icon1.svg', author_id: @user.id)
    @bill1 = Bill.create!(name: 'Test bill 1', amount: 50.0, service_id: @service.id, author_id: @user.id)
    @bill2 = Bill.create!(name: 'Test bill 2', amount: 50.0, service_id: @service.id, author_id: @user.id)
    @bill3 = Bill.create!(name: 'Test bill 3', amount: 50.0, service_id: @service.id, author_id: @user.id)

    visit new_user_session_path

    fill_in 'E-mail', with: @user.email
    fill_in 'Password', with: 'password'
    click_button 'Log in'

    visit service_path(@service.id)
  end

  it 'displays the bill names' do
    expect(page).to have_content('Test bill 1')
    expect(page).to have_content('Test bill 2')
    expect(page).to have_content('Test bill 3')
  end

  it 'displays the total amount of all transactions' do
    expect(page).to have_content('$150.0')
  end

  it 'displays the creation date of the bills' do
    expect(page).to have_css('.bill-info', count: 3)
  end

  it 'displays all transactions' do
    expect(page).to have_css('.bill', count: 3)
  end

  it 'displays each bill amount' do
    expect(page).to have_content('$50.0')
  end
end
