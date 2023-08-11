class Bill < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_and_belongs_to_many :services

  validates :name, presence: true
  validates :amount, presence: true, numericality: { greater_than_or_equal_to: 0 }
end
