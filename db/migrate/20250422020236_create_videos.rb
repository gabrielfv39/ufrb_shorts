class CreateVideos < ActiveRecord::Migration[8.0]
  def change
    create_table :videos do |t|
      t.string :title
      t.text :synopsis
      t.string :youtube_url
      t.string :duration
      t.text :cast
      t.text :crew
      t.string :category
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
