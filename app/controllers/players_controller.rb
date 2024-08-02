# app/controllers/players_controller.rb
class PlayersController < ApplicationController
  before_action :set_player, only: %i[show edit update destroy select]

  def index
    @players = Player.all
  end

  def show; end

  def new
    @player = Player.new
  end

  def edit; end

  def create
    @player = Player.new(player_params)

    if @player.save
      redirect_to @player, notice: 'Player was successfully created.'
    else
      render :new
    end
  end

  def update
    if @player.update(player_params)
      redirect_to @player, notice: 'Player was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @player.destroy
    redirect_to players_url, notice: 'Player was successfully destroyed.'
  end

  def create_teams
    @players = Player.where(selected: true)
    team_size = params[:team_size].to_i

    @teams = TeamBuilder.new(@players).balanced_teams(team_size)
    render :create_teams
  end

  def select
    @player.update(selected: !@player.selected)
    redirect_to players_path
  end

  def import
    if params[:file].present?
      Player.import(params[:file])
      redirect_to players_path, notice: 'Players imported successfully.'
    else
      redirect_to players_path, alert: 'Please upload a valid CSV file.'
    end
  end

  private

  def set_player
    @player = Player.find(params[:id])
  end

  def player_params
    params.require(:player).permit(:first_name, :last_name, :avatar, :attack, :defense, :vista, :endurance, :selected)
  end
end
