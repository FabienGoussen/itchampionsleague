class ChangePlayerAttributesToDecimal < ActiveRecord::Migration[7.0]
  def change
    change_column :players, :technique, :decimal, precision: 5, scale: 2
    change_column :players, :vista_collectif, :decimal, precision: 5, scale: 2
    change_column :players, :physique, :decimal, precision: 5, scale: 2
  end
end
