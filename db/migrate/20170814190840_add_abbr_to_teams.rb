class AddAbbrToTeams < ActiveRecord::Migration[5.1]
  def change
      add_column :teams, :abbr, :string
  end
end
