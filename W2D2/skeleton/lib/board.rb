class Board
  attr_accessor :cups

  def initialize(name1, name2)
  @name1 = name1
  @name2 = name2
  @cups = Array.new(14) { Array.new }
  place_stones
  end

  def place_stones
    # helper method to #initialize every non-store cup with four stones each
    @cups.each_with_index do |cup, i|
      next if i == 6 || i == 13
        4.times do
          cup << :stone
      end
    end
  end

  def valid_move?(start_pos)
  raise "Invalid starting cup" if start_pos < 0 || start_pos > 13
  raise "Invalid starting cup" if cups[start_pos].empty?
  end

  def make_move(start_pos, current_player_name)
    stones = @cups[start_pos]
    @cups[start_pos] = []

    until stones.empty?
      start_pos += 1
      if current_player_name == @name1 && start_pos == 13
        next
      end
      if current_player_name == @name2 && start_pos == 6
        next
      end
      @cups[start_pos] << stones.pop 
    end


  end

  def next_turn(ending_cup_idx)
    # helper method to determine what #make_move returns
  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?
  end

  def winner
    player1_count = cups[6].count
    player2_count = cups[13].count
    if player1_count == player2_count
      return "Draw!"
    elsif player1_count > player2_count
      return "@name1 wins!"
    elsif player1_count < player2_count
      return "@name2 wins!"
    end
  end
end
