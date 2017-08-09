class CreateScoreboards < ActiveRecord::Migration[5.1]
  def change
    create_table :scoreboards do |t|
      t.integer :week
      t.string :away_team
      t.string :home_team
      t.integer :away_points
      t.integer :home_points

      t.timestamps
    end
  end
end
