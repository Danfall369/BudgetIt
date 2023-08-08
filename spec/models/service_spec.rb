require 'rails_helper'

RSpec.describe Service, type: :model do
  describe 'validations' do
    it 'is valid with valid attributes' do
      author = User.create(name: 'John Doe')
      service = Service.new(name: 'Example Service', icon: 'example.png', author:)
      expect(service).to be_valid
    end

    it 'is invalid without a name' do
      author = User.create(name: 'John Doe')
      service = Service.new(name: nil, icon: 'example.png', author:)
      service.valid?
      expect(service.errors[:name]).to include("can't be blank")
    end

    it 'is invalid without an icon' do
      author = User.create(name: 'John Doe')
      service = Service.new(name: 'Example Service', icon: nil, author:)
      service.valid?
      expect(service.errors[:icon]).to include("can't be blank")
    end

    it 'is invalid without an author' do
      service = Service.new(name: 'Example Service', icon: 'example.png', author: nil)
      service.valid?
      expect(service.errors[:author]).to include('must exist')
    end
  end

  describe 'associations' do
    it 'belongs to an author' do
      association = described_class.reflect_on_association(:author)
      expect(association.macro).to eq :belongs_to
    end
  end
end
