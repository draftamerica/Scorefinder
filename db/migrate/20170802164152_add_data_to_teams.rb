class AddDataToTeams < ActiveRecord::Migration[5.1]
  def change
      add_column :teams, :name, :string
      add_column :teams, :stadium, :string
      add_column :teams, :record, :string
      add_column :teams, :titles, :integer
      add_column :teams, :rival, :string
  end
end
