class RockPaperScissors

  # Exceptions this class can raise:
  class NoSuchStrategyError < StandardError ; end
  
  @matchups = {
    "P against R" => "win",
    "P against S" => "lose",
    "R against P" => "lose",
    "R against S" => "win",
    "S against R" => "lose",
    "S against P" => "win"
  }
  
  def self.winner(player1, player2)

    if !@matchups.include? "#{player1[1]} against #{player2[1]}" and player1[1] != player2[1]
      raise NoSuchStrategyError.new("Strategy must be one of R,P,S")
    elsif player1[1] == player2[1]
      player1
    elsif @matchups["#{player1[1]} against #{player2[1]}"] == "win"
      player1
    else
      player2
    end
    
  end

  def self.tournament_winner(tournament)

    if tournament[0].is_a? String
      tournament
    else
      tournament[0] = self.tournament_winner tournament[0]
      tournament[1] = self.tournament_winner tournament[1]
      
      self.winner tournament[0], tournament[1]
    end
  end

end
