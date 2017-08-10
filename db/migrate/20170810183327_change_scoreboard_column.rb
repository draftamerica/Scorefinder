class ChangeScoreboardColumn < ActiveRecord::Migration[5.1]
  def change
      remove_column :comments, :game_id
      add_column :comments, :scoreboard_id, :integer
  end
end
