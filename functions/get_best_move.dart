import 'dart:math';

class GetBestMove {
  var checkWining;
  var possibleMoves;
  var boardIsFilled;
  String ai;
  String player;

  GetBestMove({
    required this.checkWining,
    required this.possibleMoves,
    required this.boardIsFilled,
    required this.ai,
    required this.player,
  });

// minimax algorithm
  int _minimax(board, int depth, bool isMaximizingPlayer) {
    int score = checkWining(board);
    List<int> availableCells = possibleMoves(board);

    if (score == 10 || score == -10) {
      return score;
    }

    if (boardIsFilled(board)) return 0;

    if (isMaximizingPlayer) {
      int best = -1000;

      for (int cell in availableCells) {
        // save current element
        int currentCell = cell;

        // select current index
        int cellIndex = cell - 1;

        // change index with x (it's player value)
        board[cellIndex] = player;

        best = max(best, _minimax(board, depth + 1, false));

        // replace current index with the original value
        board[cellIndex] = "$currentCell";
      }
      return best;
    } else {
      int best = 1000;

      for (int cell in availableCells) {
        // save current element
        int currentCell = cell;

        // select current index
        int cellIndex = cell - 1;

        // change index with O (it's ai value)
        board[cellIndex] = ai;

        best = min(best, _minimax(board, depth + 1, true));

        // replace current index with the original value
        board[cellIndex] = "$currentCell";
      }
      // print("ai best $best");

      return best;
    }
  }

// find the best move for AI
  int findBestMove(board) {
    // defualt best value in first with 1000 and best move index with -1
    int bestVal = 1000;
    int bestMove = -1;

    // get all free cells in board that i can move in
    List<int> availableCells = possibleMoves(board);

    //loop in all free cells to try all probabilties in these
    for (int cell in availableCells) {
      // save current element (temp element)
      int currentCell = cell;

      // select current index
      int cellIndex = cell - 1;

      // change index with O (it's ai value)
      board[cellIndex] = ai;

      // try with minimax algurithm all probabilies that stands on this move
      int moveVal = _minimax(board, 0, true);
      // replace current index with the original value
      board[cellIndex] = "$currentCell";

      // save score of this move
      if (moveVal < bestVal) {
        bestMove = cellIndex;
        bestVal = moveVal;
      }
    }
    //finnally return best move for ai
    return bestMove;
  }
}
