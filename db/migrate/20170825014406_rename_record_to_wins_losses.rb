class RenameRecordToWinsLosses < ActiveRecord::Migration[5.1]
  def change
      rename_column :teams, :record, :wins_losses
  end
end
