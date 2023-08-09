require 'rails_helper'

RSpec.describe Service, type: :model do
  before :each do
    user = User.new(id: 1, name: 'User1')
    user.email = 'user1@email.com'
    user.password = '123456'
    user.password_confirmation = '123456'
    user.save
  end

  subject do
    Service.new(
      name: 'Internet',
      icon: 'https://d1nhio0ox7pgb.cloudfront.net/_img/g_collection_png/standard/128x128/wifi.png',
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

  it 'is not valid with invalid icon attribute' do
    subject.icon = ''
    expect(subject).to_not be_valid
  end
end
