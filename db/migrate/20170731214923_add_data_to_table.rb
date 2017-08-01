class AddDataToTable < ActiveRecord::Migration[5.1]
  def change
      add_column :sports_test_tables, :week, :integer
      add_column :sports_test_tables, :away_team, :string
      add_column :sports_test_tables, :home_team, :string
      add_column :sports_test_tables, :away_points, :integer
      add_column :sports_test_tables, :home_points, :integer
  end
end
