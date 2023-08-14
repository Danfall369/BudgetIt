require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) do
    User.new(
      id: 1,
      name: 'User1',
      email: 'user1@email.com',
      password: '123456',
      password_confirmation: '123456'
    )
  end

  before :each do
    user.save
  end

  it 'is valid with valid attributes' do
    expect(user).to be_valid
  end

  it 'is not valid with invalid name attribute' do
    user.name = nil
    expect(user).to_not be_valid
  end

  it 'is not valid with invalid email attribute' do
    user.email = nil
    expect(user).to_not be_valid
  end

  it 'is not valid with invalid password attribute' do
    user.password = nil
    expect(user).to_not be_valid
  end
end
