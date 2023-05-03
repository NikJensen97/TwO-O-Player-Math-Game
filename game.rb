class Game
  def initialize(name)
    @name = name
    @player_1 = Player.new('player 1')
    @player_2 = Player.new('player 2')
  end

  def start
    puts "New game begins! #{@player_1.name} VS #{@player_2.name}"
    turn
  end
  #i would have liked to impliment a turn count to display but no time
  def turn
    @player_1.new_question
    check_score
    @player_2.new_question
    check_score
    show_stats
    puts '--------NEXT-TURN--------'
    turn
  end
  
  def winner(player)
    puts "#{player.name} wins with the score of #{player.lives}/3"
    puts '---------GAME-OVER--------'
    puts 'Thanks for playing!'
    exit(0)
  end
  # If this is used in future, should impliment a last question for p2 if p1 loses. maybe they both can lose!
  def check_score
    if @player_1.dead
      winner(@player_2)
    elsif @player_2.dead
      winner(@player_1)
    end
  end

  def show_stats
    puts "#{@player_1.name}: #{@player_1.lives}/3 vs #{@player_2.name}: #{@player_2.lives}/3"
  end

end