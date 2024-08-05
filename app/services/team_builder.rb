# app/services/team_builder.rb
class TeamBuilder
  def initialize(players)
    @players = players
  end

  def balanced_teams(team_size)
    teams = []
    players_copy = @players.dup

    while players_copy.size > 0
      team = players_copy.shift(team_size)
      teams << team
    end

    teams
  end
end
