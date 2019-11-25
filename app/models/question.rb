class Question < ApplicationRecord
  belongs_to :category, optional: true
  extend FriendlyId
  friendly_id :id, use: :slugged

  # validates :title, :answer, uniqueness: true
end

 