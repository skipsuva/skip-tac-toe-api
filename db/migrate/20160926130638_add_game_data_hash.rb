class AddGameDataHash < ActiveRecord::Migration[5.0]
  def change
    add_column :games, :game_data, :json
  end
end
