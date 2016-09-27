class AddStalemateToGame < ActiveRecord::Migration[5.0]
  def change
    add_column :games, :is_stalemate, :boolean
  end
end
