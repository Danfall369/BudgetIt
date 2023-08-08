class User < ApplicationRecord
  has_many :services, foreign_key: 'author_id'
  has_many :bills, foreign_key: 'author_id'

  validates :name, presence: true
end
