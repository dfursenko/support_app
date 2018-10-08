class CreateArticles < ActiveRecord::Migration[5.1]
  def change
    create_table :articles do |t|
      t.references :user, foreign_key: true
      t.references :category, foreign_key: true
      t.string :title, null: false
      t.text :body
      t.boolean :published, default: false

      t.timestamps
    end
  end
end
