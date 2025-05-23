class CreateComments < ActiveRecord::Migration[8.0]
  def change
    create_table :comments do |t|
      t.text :content
      t.string :user_name
      t.references :video, null: false, foreign_key: true

      t.timestamps
    end
  end
end
