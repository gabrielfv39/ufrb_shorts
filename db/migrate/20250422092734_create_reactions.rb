class CreateReactions < ActiveRecord::Migration[8.0]
  def change
    create_table :reactions do |t|
      t.references :video, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.string :reaction_type

      t.timestamps
    end
  end
end
