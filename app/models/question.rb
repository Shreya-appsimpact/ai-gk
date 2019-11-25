class Question < ApplicationRecord
  require 'csv'
  belongs_to :category, optional: true
  extend FriendlyId
  friendly_id :id, use: :slugged

  validates :title, :answer, uniqueness: true

  def self.import(file, category)
    CSV.foreach(file.path, headers: true) do |row|
      row["category_id"] = category
      Question.create! row.to_hash
    end
  end  

end

 