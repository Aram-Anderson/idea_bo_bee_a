class CreateIdeaImages < ActiveRecord::Migration[5.1]
  def change
    create_table :idea_images do |t|
      t.belongs_to :idea, index: true, foreign_key: true
      t.belongs_to :image, index: true, foreign_key: true

      t.timestamps
    end
  end
end
