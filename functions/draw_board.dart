class DrawBoard {
  draw(List board) {
    String boardDesign = ''' --- --- ---
| ${board[0]} | ${board[1]} | ${board[2]} |
 --- --- ---
| ${board[3]} | ${board[4]} | ${board[5]} |
 --- --- ---
| ${board[6]} | ${board[7]} | ${board[8]} |
 --- --- ---''';
    print(boardDesign);
  }
}
