class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.integer :movie_id
      t.string :title
      t.string :content

      t.timestamps null: false
    end
  end
end
