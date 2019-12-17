class AddCategoryIdToVideos < ActiveRecord::Migration[5.2]
  def change
    add_reference :videos, :category, foreign_key: true
  end
end
