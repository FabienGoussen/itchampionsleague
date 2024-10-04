# app/controllers/registrations_controller.rb
class RegistrationsController < ApplicationController
  before_action :set_registration, only: [:destroy]

  def new
    @registration = Registration.new
    @players = Player.all
  end

  def create
    @registration = Registration.new(registration_params)
    if @registration.save
      redirect_to registrations_path, notice: 'Player registered successfully.'
    else
      render :new
    end
  end

  def index
    @registrations = Registration.all
  end

  def destroy
    @registration.destroy
    redirect_to registrations_path, notice: 'Registration was successfully destroyed.'
  end

  def create_teams
    @players = if params[:date].present?
                 Registration.where('created_at >= ?', Date.parse(params[:date])).includes(:player).map(&:player)
               else
                 Registration.includes(:player).map(&:player)
               end

    team_size = params[:team_size].to_i

    if @players.empty?
      redirect_to registrations_path, alert: "No players available for team creation."
    else
      team_builder = TeamBuilder.new(@players)
      @teams = team_builder.balanced_teams(@players, team_size)

      Team.transaction do
        @teams.each_with_index do |team, index|
          team.each do |player|
            Team.create(player: player, team_number: index + 1)
          end
        end
      end

      redirect_to teams_registrations_path
    end
  end

  def teams
    @teams = Team.all.group_by(&:team_number).map { |team_number, team| team.map(&:player) }
    @team_averages = @teams.map do |team|
      {
        technique: average_score(team, :technique),
        vista_collectif: average_score(team, :vista_collectif),
        physique: average_score(team, :physique)
      }
    end
  end


  private

  def average_score(players, attribute)
    scores = players.map(&attribute)
    scores.sum / scores.size.to_f
  end

  def set_registration
    @registration = Registration.find(params[:id])
  end

  def registration_params
    params.require(:registration).permit(:player_id)
  end

  def average_score(players, attribute)
    scores = players.map(&attribute)
    scores.sum / scores.size.to_f
  end
end
