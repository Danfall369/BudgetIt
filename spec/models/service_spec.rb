require 'rails_helper'

RSpec.describe Service, type: :model do
  before :each do
    @user = User.create(
      id: 1,
      name: 'User1',
      email: 'user1@email.com',
      password: '123456',
      password_confirmation: '123456'
    )
  end

  subject do
    Service.new(
      name: 'Internet',
      icon: 'https://d1nhio0ox7pgb.cloudfront.net/_img/g_collection_png/standard/128x128/wifi.png',
      author_id: @user.id
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

    it 'is not valid with an empty icon attribute' do
      subject.icon = ''
      expect(subject).to_not be_valid
    end
  end
end
