# app/models/player.rb
class Player < ApplicationRecord
  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|
      player_hash = row.to_hash
      player = Player.find_or_create_by!(first_name: player_hash['first_name'], last_name: player_hash['last_name'])
      player.update(player_hash)
    end
  end
end
