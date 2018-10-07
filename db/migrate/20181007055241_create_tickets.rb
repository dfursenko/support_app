class CreateTickets < ActiveRecord::Migration[5.1]
  def change
    create_table :tickets do |t|
      t.references :user, null: false, foreign_key: true
      t.text :body, null: false
      t.integer :moderator_id, index: true
      t.boolean :status, null: false, default: true

      t.timestamps
    end
  end
end
