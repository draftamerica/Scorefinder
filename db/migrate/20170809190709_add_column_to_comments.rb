class AddColumnToComments < ActiveRecord::Migration[5.1]
  def change
      add_column :comments, :game_id, :integer
  end
end
