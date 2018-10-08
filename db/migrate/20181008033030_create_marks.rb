class CreateMarks < ActiveRecord::Migration[5.1]
  def change
    create_table :marks do |t|
      t.references :user, foreign_key: true
      t.references :article, foreign_key: true
      t.boolean :value

      t.timestamps
    end
  end
end
