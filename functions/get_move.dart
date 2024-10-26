import 'dart:math';

class GetMove {
  int getRandomNumber(List<int> availableCells) {
    while (true) {
      final random = Random();
      int index = random.nextInt(8) + 1;
      for (int i in availableCells) {
        if (i == index) return index;
      }
    }
  }

  int getPlayWithRatio(int bestMove, int difficulty, List<int> availableCells) {
    final random = Random();
    int index = random.nextInt(9);
    if (index > difficulty) {
      return getRandomNumber(availableCells) - 1;
    }
    return bestMove;
  }
}
