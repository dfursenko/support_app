class ChangeComments < ActiveRecord::Migration[5.1]
  def change
    change_column_null :comments, :body, false
    change_column_default :comments, :published, false
  end
end
