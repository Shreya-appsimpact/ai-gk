class Question < ApplicationRecord
  belongs_to :category, optional: true
  extend FriendlyId
  friendly_id :question, use: :slugged
end

 