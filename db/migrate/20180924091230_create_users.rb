class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :email, unique: true
      t.string :password
      t.references :role, foreign_key: true

      t.timestamps
    end
    add_index :users, :email
  end
end
