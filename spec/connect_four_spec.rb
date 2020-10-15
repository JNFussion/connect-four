require '../lib/connect_four'

describe "connect_four" do
    
    describe "#horizontal_win" do
        
        it "return X if 4 player1's pieces connect" do 
            game = ConnectFour.new
            board = game.board
            board[rand(0..5)] = ['O', 'X', 'X', 'X', 'X', 'O', 'O']
            expect(game.horizontal_win).to eql('X')
        end


        it "return O if 4 player2's pieces connect" do
            game = ConnectFour.new
            board = game.board
            board[rand(0..5)] = ['X', 'O', 'O', 'O', 'O', 'X', 'X']
            expect(game.horizontal_win).to eql('O')
        end

        it "return nil if there is no horizontal win" do
        game = ConnectFour.new
        board = game.board
        board[rand(0..5)] = ['X', 'O', 'O', 'O', 'X', 'X', 'X']
        expect(game.horizontal_win).to eql(nil)
        end

    end

    describe "#vertical_win?" do
        
        it "return X if 4 player1's pieces connect" do
            game = ConnectFour.new
            board = game.board
            colunm = rand(0..6)
            board[0][colunm] = 'O'
            (1..4).each do |index|
                board[index][colunm] = 'X'
            end
            board[5][colunm]  = 'O'
            expect(game.vertical_win).to eql('X')
        end
        
        it "return O if 4 player2's pieces connect" do
            game = ConnectFour.new
            board = game.board
            colunm = rand(0..6)
            board[0][colunm] = 'X'
            (1..4).each do |index|
                board[index][colunm] = 'O'
            end
            board[5][colunm]  = 'X'
            expect(game.vertical_win).to eql('O')
        end

        it "return nil if there is no vertical win" do
            game = ConnectFour.new
            board = game.board
            colunm = rand(0..6)
            (0..5).each do |index|
                index.even? ? board[index][colunm] = 'O' : board[index][colunm] = 'X'
            end
            expect(game.vertical_win).to eql(nil)
        end

    end

    describe "#diagonal_win" do
        it "return X if 4 player1's pieces connect" do
            game = ConnectFour.new
            board = game.board
            board.size.times do |index|
                board[index][index] = 'X'
            end
            expect(game.diagonal_win).to eql('X')
        end
        
        it "return O if 4 player2's pieces connect" do
            game = ConnectFour.new
            board = game.board
            board.size.times do |index|
            board[index][index] = 'O'
            end
            expect(game.diagonal_win).to eql('O')
        end

        it "return nil if there is no vertical win" do
            game = ConnectFour.new
            board = game.board
            board.size.times do |index|
                index.even? ? board[index][index] = 'O' : board[index][index] = 'X'
            end
            expect(game.diagonal_win).to eql(nil)
        end

    end

    describe "#winner" do
        
        it "return X if 4 player1's pieces connect" do 
            game = ConnectFour.new
            board = game.board
            board[rand(0..5)] = ['O', 'X', 'X', 'X', 'X', 'O', 'O']
            expect(game.winner).to eql('X')
        end


        it "return O if 4 player2's pieces connect" do
            game = ConnectFour.new
            board = game.board
            board[rand(0..5)] = ['X', 'O', 'O', 'O', 'O', 'X', 'X']
            expect(game.winner).to eql('O')
        end

        it "return nil if there is no horizontal win" do
            game = ConnectFour.new
            board = game.board
            board[rand(0..5)] = ['X', 'O', 'O', 'O', 'X', 'X', 'X']
            expect(game.winner).to eql(nil)
        end

        it "return X if 4 player1's pieces connect" do
            game = ConnectFour.new
            board = game.board
            colunm = rand(0..6)
            board[0][colunm] = 'O'
            (1..4).each do |index|
                board[index][colunm] = 'X'
            end
            board[5][colunm]  = 'O'
            expect(game.winner).to eql('X')
        end
        
        it "return O if 4 player2's pieces connect" do
            game = ConnectFour.new
            board = game.board
            colunm = rand(0..6)
            board[0][colunm] = 'X'
            (1..4).each do |index|
                board[index][colunm] = 'O'
            end
            board[5][colunm]  = 'X'
            expect(game.winner).to eql('O')
        end

        it "return nil if there is no vertical win" do
            game = ConnectFour.new
            board = game.board
            colunm = rand(0..6)
            (0..5).each do |index|
                index.even? ? board[index][colunm] = 'O' : board[index][colunm] = 'X'
            end
            expect(game.winner).to eql(nil)
        end

        it "return X if 4 player1's pieces connect" do
            game = ConnectFour.new
            board = game.board
            board.size.times do |index|
                board[index][index] = 'X'
            end
            expect(game.winner).to eql('X')
        end
        
        it "return O if 4 player2's pieces connect" do
            game = ConnectFour.new
            board = game.board
            board.size.times do |index|
            board[index][index] = 'O'
            end
            expect(game.winner).to eql('O')
        end

        it "return nil if there is no vertical win" do
            game = ConnectFour.new
            board = game.board
            board.size.times do |index|
                index.even? ? board[index][index] = 'O' : board[index][index] = 'X'
            end
            expect(game.winner).to eql(nil)
        end


    end
    
end