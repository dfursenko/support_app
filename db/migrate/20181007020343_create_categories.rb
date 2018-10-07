class CreateCategories < ActiveRecord::Migration[5.1]
  def change
    create_table :categories do |t|
      t.string :title
      t.integer :level
      t.references :parent, foreign_key: true
      t.boolean :published

      t.timestamps
    end
  end
end
