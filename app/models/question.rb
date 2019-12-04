class Question < ApplicationRecord
  require 'csv'
  extend FriendlyId
  friendly_id :id, use: :slugged
  belongs_to :category, optional: true

  validates :title, :answer, uniqueness: true

  def self.import(file, category)
    CSV.foreach(file.path, headers: true) do |row|
      row["category_id"] = category
      question = Question.new(row.to_hash) 
      return false unless question.valid?
      question.save
    end
  end  
end
