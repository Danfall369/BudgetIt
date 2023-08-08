require 'rails_helper'

RSpec.describe Bill, type: :model do
  describe 'validations' do
    it 'is valid with valid attributes' do
      author = User.create(name: 'John Doe')
      bill = Bill.new(name: 'Electricity Bill', amount: 100, author:)
      expect(bill).to be_valid
    end

    it 'is invalid without a name' do
      author = User.create(name: 'John Doe')
      bill = Bill.new(name: nil, amount: 100, author:)
      bill.valid?
      expect(bill.errors[:name]).to include("can't be blank")
    end

    it 'is invalid without an amount' do
      author = User.create(name: 'John Doe')
      bill = Bill.new(name: 'Electricity Bill', amount: nil, author:)
      bill.valid?
      expect(bill.errors[:amount]).to include("can't be blank")
    end

    it 'is invalid without an author' do
      bill = Bill.new(name: 'Electricity Bill', amount: 100, author: nil)
      bill.valid?
      expect(bill.errors[:author]).to include('must exist')
    end
  end

  describe 'associations' do
    it 'belongs to an author' do
      association = described_class.reflect_on_association(:author)
      expect(association.macro).to eq :belongs_to
    end
  end
end
