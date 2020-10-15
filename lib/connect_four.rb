require 'pry'

class ConnectFour
  attr_accessor :board

  @@PLAYER_1 = 'X'
  @@PLAYER_2 = 'O'

  def initialize
    @board = Array.new(6) { Array.new(7, '.') }
  end

  def play
    loop do
      draw_board

      turn_player(@@PLAYER_1)

      draw_board

      winner = self.winner
    end
  end

    def turn_player(player_simbol)
      loop do
        puts "Turn of player #{player_simbol == 'X' ? 1 : 2} : "
        puts 'Introduce the number of the column: '

        input = gets.chomp
        break unless add(input, 'X').nil?
      end
    end

    def add(column, player_simbol)
      column = column.to_i - 1
      return if column < 0 || column > 6

      5.downto(0) do |numb|
        if @board[numb][column] == '.'
          @board[numb][column] = player_simbol
          return [numb, column]
        end
      end
    end

    def horizontal_win(board = @board)
      board.each do |row|
        row.each_with_index do |value, index|
          win = true
          if value == 'X'
            if index + 4 <= row.size
              (1..3).each do |numb|
                if row[numb + index] != 'X'
                  win = false
                  break
                end
              end
              return 'X' if win
            end
          elsif value == 'O'
            if index + 4 <= row.size
              (1..3).each do |numb|
                if row[numb + index] != 'O'
                  win = false
                  break
                end
              end
              return 'O' if win
            end
          end
        end
      end

      nil
    end

    def vertical_win
      transpose = @board.transpose
      horizontal_win(transpose)
    end

    # Get all diagonals, form left to right and form right to left.

    def diagonal_win
      arr = @board
      padding = [*0..(arr.length - 1)].map { |i| [nil] * i }
      padded = padding.reverse.zip(arr).zip(padding).map(&:flatten)
      padded2 = padding.zip(arr).reverse.zip(padding).map(&:flatten)
      diagonals_downward = padded.transpose.map(&:compact)
      diagonals_upward = padded2.transpose.map(&:compact)
      diagonals_downward.delete_if { |diagonal| diagonal.size < 4}
      diagonals_upward.delete_if { |diagonal| diagonal.size < 4}

      option = horizontal_win(diagonals_downward).nil?
      return option unless option.nil?

      horizontal_win(diagonals_upward)
    end

    def winner
      option_1 = horizontal_win
      option_2 = vertical_win
      option_3 = diagonal_win

      option_1 || option_2 || option_3
    end

    def draw_board
      vertical_line = "\u2503"
      horizontal_line = "\u2501"
      horizontal_line_dotted = "\u254C"
      vertical_line_dotted = "\u2507"
      left_corner = "\u2517"
      right_corner = "\u251B"

      puts
      (1..7).each do |numb|
        print "  #{numb} "
      end
      print "\n\n"

      @board.each_with_index do |row, index_row|
        print vertical_line.encode('utf-8') + ' '
        row.each_with_index do |value, index|
          print value.to_s + ' ' if index == row.size - 1
          print value.to_s + ' ' + vertical_line_dotted.encode('utf-8') + ' ' if index < row.size - 1
        end
        puts vertical_line.encode('utf-8')
        next unless index_row < row.size - 2

        print print vertical_line.encode('utf-8') + ' '
        7.times do |num|
          print horizontal_line_dotted.encode('utf-8') + ' ' if num == 6
          print horizontal_line_dotted.encode('utf-8') + ' ' + vertical_line_dotted.encode('utf-8') + ' ' if num < 6
        end
        puts vertical_line.encode('utf-8')
      end
      print left_corner.encode('utf-8')
      print horizontal_line.encode('utf-8') * 27
      puts right_corner.encode('utf-8')
      puts
    end
end
