require 'rails_helper'

RSpec.describe Bill, type: :model do
  before :each do
    # Create a user
    @user = User.create(
      id: 1,
      name: 'user1',
      email: 'user1@email.com',
      password: '123456',
      password_confirmation: '123456'
    )

    # Create a service
    @service = Service.create(
      name: 'Internet',
      icon: 'https://d1nhio0ox7pgb.cloudfront.net/_img/g_collection_png/standard/128x128/wifi.png',
      author_id: @user.id
    )
  end

  subject do
    Bill.new(
      author_id: @user.id,
      service_id: @service.id,
      name: 'Netflix',
      amount: 14.35
    )
  end

  before { subject.save }

  context 'validations' do
    it 'is valid with valid attributes' do
      expect(subject).to be_valid
    end

    it 'is not valid with a nil name attribute' do
      subject.name = nil
      expect(subject).to_not be_valid
    end

    it 'is not valid with a negative amount attribute' do
      subject.amount = -1
      expect(subject).to_not be_valid
    end

    it 'is valid with a valid amount attribute' do
      subject.amount = 2.5
      expect(subject).to be_valid
    end
  end
end
