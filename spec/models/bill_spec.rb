require 'rails_helper'

RSpec.describe Bill, type: :model do
  before :each do
    user = User.new(id: 1, name: 'user1')
    user.email = 'user1@email.com'
    user.password = '123456'
    user.password_confirmation = '123456'
    user.save
  end

  subject do
    Bill.new(
      name: 'Netflix',
      amount: 14.35,
      author_id: 1
    )
  end

  before { subject.save }

  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end

  it 'is not valid with invalid name attribute' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'is not valid with invalid amount attribute' do
    subject.amount = -1
    expect(subject).to_not be_valid
  end

  it 'is valid with valid amount attribute' do
    subject.amount = 2.5
    expect(subject).to be_valid
  end
end
