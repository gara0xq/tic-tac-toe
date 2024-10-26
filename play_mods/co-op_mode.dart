import '../functions/checking.dart';
import '../functions/draw_board.dart';
import '../functions/input_validation.dart';

int roundNumber = 0;
String player = "X";
String ai = "O";

class Coop_mode {
  void Play() {
    List board = ["1", "2", "3", "4", "5", "6", "7", "8", "9"];
    roundNumber = 0;

    while (!boardIsFilled(board)) {
      if (roundNumber % 2 != 0) {
        roundNumber++;
        drawBoard(board);
        board[play(board) - 1] = ai;
      } else {
        roundNumber++;
        drawBoard(board);
        board[play(board) - 1] = player;
      }
      if (checkWin(board)) break;
    }
  }
}

final draw = DrawBoard();
final checking = Checking(ai: ai, player: player, roundNumber: roundNumber);
final validate = InputValidation();

int play(board) => validate.InputValidNumber(possibleMoves(board));

void drawBoard(board) => draw.draw(board);

bool checkWin(board) => checking.whoIsWinner(drawBoard, board);

bool boardIsFilled(List board) => checking.boardIsFilled(board);

List<int> possibleMoves(List board) => checking.possibleMoves(board);
