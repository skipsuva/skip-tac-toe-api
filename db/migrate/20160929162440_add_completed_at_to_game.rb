class AddCompletedAtToGame < ActiveRecord::Migration[5.0]
  def change
    add_column :games, :completed_at, :datetime
  end
end
