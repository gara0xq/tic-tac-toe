class Checking {
  int roundNumber;
  String ai;
  String player;

  Checking({
    required this.ai,
    required this.player,
    required this.roundNumber,
  });

  int checkWining(List board) {
    List<List<int>> probabilties = [
      [0, 1, 2],
      [3, 4, 5],
      [6, 7, 8],
      [0, 3, 6],
      [1, 4, 7],
      [2, 5, 8],
      [0, 4, 8],
      [2, 4, 6],
    ];

    for (List<int> prob in probabilties) {
      if (board[prob[0]] == "X" && board[prob[1]] == "X" && board[prob[2]] == "X") {
        return 10;
      } else if (board[prob[0]] == "O" && board[prob[1]] == "O" && board[prob[2]] == "O") {
        return -10;
      }
    }
    return 0;
  }

  bool boardIsFilled(List board) {
    int numberOfWaitingIndex = 0;
    for (var i in board) {
      if (i != "O" && i != "X") {
        numberOfWaitingIndex++;
      }
    }
    return numberOfWaitingIndex == 0 ? true : false;
  }

  List<int> possibleMoves(List board) {
    List<int> listOfPossibleMoves = [];
    for (var i in board) {
      if (i != "O" && i != "X") {
        listOfPossibleMoves.add(int.parse(i));
      }
    }
    return listOfPossibleMoves;
  }

  String getXORound() {
    if (roundNumber % 2 == 0) {
      roundNumber++;
      return player;
    } else {
      roundNumber++;
      return ai;
    }
  }

  bool whoIsWinner(drawBoard, board) {
    if (checkWining(board) == 10) {
      drawBoard(board);
      print("X is Winner");
      return true;
    } else if (checkWining(board) == -10) {
      drawBoard(board);
      print("O is Winner");
      return true;
    } else if (boardIsFilled(board)) {
      drawBoard(board);
      print("Draw");
      return true;
    }
    return false;
  }
}
