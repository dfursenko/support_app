class CreateTickets < ActiveRecord::Migration[5.1]
  def change
    create_table :tickets do |t|
      t.references :user, foreign_key: true
      t.text :body
      t.references :moderator, foreign_key: true
      t.boolean :status

      t.timestamps
    end
  end
end
