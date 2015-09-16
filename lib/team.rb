class Team

  def initialize
    @players = []
  end

  def add player
    players << player
  end

  def validate_team?
    player_count >= 7 && player_count <= 10 && valid_gender_ratio?
  end

  def player_count
    players.count
  end

  private

  def valid_gender_ratio?
    @players.male_count >= 2
  end

  attr_reader :players
end
