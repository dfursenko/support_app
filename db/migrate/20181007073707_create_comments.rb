class CreateComments < ActiveRecord::Migration[5.1]
  def change
    create_table :comments do |t|
      t.references :commentable, polymorphic: true, index: true
      t.string :body
      t.boolean :published

      t.timestamps
    end
  end
end
