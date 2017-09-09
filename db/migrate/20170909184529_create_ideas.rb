class CreateIdeas < ActiveRecord::Migration[5.1]
  def change
    create_table :ideas do |t|
      t.string :title
      t.text :body
      t.integer :rating, default: 0
      t.belongs_to :user, index: true, foreign_key: true

      t.timestamps
    end
  end
end
