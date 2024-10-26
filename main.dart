import 'dart:io';

import 'play_mods/co-op_mode.dart';
import 'play_mods/eazy_mod.dart';
import 'play_mods/hard_mode.dart';
import 'play_mods/imposible_mod.dart';

void main() {
  while (true) {
    menu();
    print("Do You Want Play Again ? (Y/N)");

    String input = stdin.readLineSync()!;
    input = input.trim();
    input = input.toUpperCase();

    if (input == "Y") {
      continue;
    } else if (input == "N") {
      break;
    } else {
      print("Invalid Input Enter Again :");
    }
  }
}

final regex = RegExp(r'^[1-4]$');
void menu() {
  print("play mods: \n1- with friend\n2- easy\n3- medium\n4- hard");
  print("Enter Mode Number You Want Play :");
  String input;
  while (true) {
    input = stdin.readLineSync()!;
    input = input.trim();
    if (regex.hasMatch(input)) {
      break;
    } else {
      print("Invalid Input Enter Mode Number Again :");
    }
  }
  int modeNumber = int.parse(input);
  switch (modeNumber) {
    case 1:
      Coop_mode().Play();
      break;
    case 2:
      Easy_mode().Play();
      break;
    case 3:
      Hard_mode().Play();
      break;
    case 4:
      Imposible_mode().Play();
      break;
  }
}
