class RemoveRatingFromIdeas < ActiveRecord::Migration[5.1]
  def change
    remove_column :ideas, :rating
  end
end
