# app/models/player.rb
class Player < ApplicationRecord
  has_many :registrations
  validates :first_name, :last_name, presence: true
  validates :technique, :vista_collectif, :physique, numericality: {
    greater_than_or_equal_to: 0,
    less_than_or_equal_to: 5,
    allow_nil: true
  }

  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|
      player_hash = row.to_hash
      player = Player.find_or_create_by!(first_name: player_hash['first_name'], last_name: player_hash['last_name'])
      player.update(player_hash)
    end
  end

  def full_name
    "#{first_name} #{last_name}"
  end
end
