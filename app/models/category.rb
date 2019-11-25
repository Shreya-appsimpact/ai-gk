class Category < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: :slugged
  has_many :questions, dependent: :destroy

  validates :name, uniqueness: true
end
