class CreateSportsTestTables < ActiveRecord::Migration[5.1]
  def change
    create_table :sports_test_tables do |t|

      t.timestamps
    end
  end
end
