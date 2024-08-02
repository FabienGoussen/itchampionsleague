class AddSelectedToPlayers < ActiveRecord::Migration[7.1]
  def change
    add_column :players, :selected, :boolean
  end
end
