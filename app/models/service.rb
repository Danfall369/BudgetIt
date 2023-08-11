class Service < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :bills

  validates :name, presence: true
  validates :icon, presence: true
end
