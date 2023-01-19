class ChangeCloumnsNotnullAddComments < ActiveRecord::Migration[6.1]
  def change
    change_column :comments, :comment, :text, null: false
  end
end
