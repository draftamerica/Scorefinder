class RenameTeamNametoName < ActiveRecord::Migration[5.1]
  def change
      rename_column :teams, :name, :team_name
  end
end
