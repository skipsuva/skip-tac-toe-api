class CreateGames < ActiveRecord::Migration[5.0]
  def change
    create_table :games do |t|
      t.integer :user_id
      t.boolean :player_won
      t.integer :player_move_count

      t.timestamps
    end
  end
end
