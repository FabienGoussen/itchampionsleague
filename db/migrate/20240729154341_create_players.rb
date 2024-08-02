class CreatePlayers < ActiveRecord::Migration[7.1]
  def change
    create_table :players do |t|
      t.string :first_name
      t.string :last_name
      t.string :avatar
      t.integer :attack
      t.integer :defense
      t.integer :vista
      t.integer :endurance

      t.timestamps
    end
  end
end
