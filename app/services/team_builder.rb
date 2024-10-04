# app/services/team_builder.rb
class TeamBuilder
  def initialize(players)
    @players = players
  end

  def balanced_teams(players, team_size)
    sorted_players = players.sort_by(&:total_score).reverse
    teams = Array.new((players.size / team_size.to_f).ceil) { [] }

    sorted_players.each_with_index do |player, index|
      teams[index % teams.size] << player
    end

    teams
  end
end
