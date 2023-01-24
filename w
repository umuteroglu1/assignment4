class TicTacToe:
    def __init__(self):
        self.board = [[' ' for _ in range(3)] for _ in range(3)]
        self.player = 'X'

    def play(self):
        while not self.game_over():
            self.display_board()
            row, col = self.get_player_move()
            self.board[row][col] = self.player
            self.player = 'O' if self.player == 'X' else 'X'

        if self.winner():
            print(f"Player {self.winner()} wins!")
        else:
            print("It's a tie!")

    def game_over(self):
        return self.winner() or all(all(val != ' ' for val in row) for row in self.board)

    def winner(self):
        for player in ('X', 'O'):
            for row in range(3):
                if all(self.board[row][col] == player for col in range(3)):
                    return player
            for col in range(3):
                if all(self.board[row][col] == player for row in range(3)):
                    return player
            if all(self.board[i][i] == player for i in range(3)):
                return player
            if all(self.board[i][2-i] == player for i in range(3)):
                return player
        return None

    def display_board(self):
        for row in self.board:
            print(' | '.join(row))

    def get_player_move(self):
        while True:
            try:
                row = int(input(f"Player {self.player}, enter row (0, 1, 2): "))
                col = int(input(f"Player {self.player}, enter col (0, 1, 2): "))
                if row in range(3) and col in range(3) and self.board[row][col] == ' ':
                    return row, col
                print("Invalid move, try again")
            except ValueError:
                print("Invalid input, try again")
