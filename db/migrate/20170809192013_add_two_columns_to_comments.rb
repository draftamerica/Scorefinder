class AddTwoColumnsToComments < ActiveRecord::Migration[5.1]
  def change
      add_column :comments, :title, :string
      add_column :comments, :content, :text
  end
end
