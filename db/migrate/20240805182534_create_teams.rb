class CreateTeams < ActiveRecord::Migration[7.0]
  def change
    create_table :teams do |t|
      t.references :player, null: false, foreign_key: true
      t.integer :team_number

      t.timestamps
    end
  end
end
