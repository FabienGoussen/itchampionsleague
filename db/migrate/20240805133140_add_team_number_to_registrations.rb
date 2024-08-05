class AddTeamNumberToRegistrations < ActiveRecord::Migration[7.0]
  def change
    add_column :registrations, :team_number, :integer
  end
end
