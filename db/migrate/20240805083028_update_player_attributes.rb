class UpdatePlayerAttributes < ActiveRecord::Migration[6.1]
  def change
    remove_column :players, :attack, :integer
    remove_column :players, :defense, :integer
    remove_column :players, :vista, :integer
    remove_column :players, :endurance, :integer

    add_column :players, :technique, :integer
    add_column :players, :vista_collectif, :integer
    add_column :players, :physique, :integer
  end
end
