class CreateVideos < ActiveRecord::Migration[6.0]
  def change
    create_table :videos do |t|
      t.string :slug
      t.string :name
      t.string :description
      t.string :url
      t.timestamps
      t.references :user, null: true, foreign_key: true
    end

    add_index :videos, :slug, unique: true
  end
end
