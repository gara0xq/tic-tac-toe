import 'dart:io';

class InputValidation {
  int InputValidNumber(List availableCells) {
    String play;
    while (true) {
      print("Enter Your Cell Number");
      play = stdin.readLineSync()!;
      play = play.trim();
      if (isEmptyCell(availableCells, play)) {
        break;
      }
      print("Input is not valid!");
    }
    return int.parse(play);
  }

  bool isValidNumber(play) {
    final regex = RegExp(r'^[1-9]$');
    return regex.hasMatch(play);
  }

  bool isEmptyCell(List availableCells, play) {
    if (!isValidNumber(play)) return false;
    int index = int.parse(play);
    for (var cell in availableCells) {
      if (cell == index) {
        return true;
      }
    }
    return false;
  }
}
