describre "connect_four" do
    
    describe "#horizontal_win" do
        
        it "return X if 4 player1's pieces connect"
            game = Board.new
            board = game.board
            board[rand(0..5)] = ['O', 'X', 'X', 'X', 'X', 'O', 'O']
            expect(game.horizontal_win).to eql('X')
        end


        it "return O if 4 player2's pieces connect"
            game = Board.new
            board = game.board
            board[rand(0..5)] = ['X', 'O', 'O', 'O', 'O', 'X', 'X']
            expect(game.horizontal_win).to eql('O')
        end

        it "return nil if there is no horizontal win"
        game = Board.new
        board = game.board
        board[rand(0..5)] = ['X', 'O', 'O', 'O', 'X', 'X', 'X']
        expect(game.horizontal_win).to eql(nil)
    end

    end

    describe "#vertical_win?" do
        it "return X if 4 player1's pieces connect"
        game = Board.new
        board = game.board
        board[0].size.times do |index|
            board[2][index] = 'X'
        end
        expect(game.vertical_win).to eql('X')
        end
        
        it "return O if 4 player2's pieces connect"
        game = Board.new
        board = game.board
        board[0].size.times do |index|
            board[2][index] = 'O'
        end
        expect(game.vertical_win).to eql('O')
        end

        it "return nil if there is no vertical win"
        game = Board.new
        board = game.board
        expect(game.vertical_win).to eql(nil)
        end

    end

    describe "#diagonal_win?" do
        
    end
    
end