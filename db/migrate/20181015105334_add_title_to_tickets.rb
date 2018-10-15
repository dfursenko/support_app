class AddTitleToTickets < ActiveRecord::Migration[5.1]
  def change
    add_column :tickets, :title, :string, null: false, default: ""
  end
end
