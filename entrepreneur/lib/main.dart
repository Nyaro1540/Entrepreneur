import 'package:flutter/material.dart';
import 'package:flame/game.dart';

void main() {
  runApp(GameWidget(game: EntrepreneurGame()));
}

class EntrepreneurGame extends FlameGame {
  @override
  Color backgroundColor() => const Color(0xFF333333); // Fond gris foncé

  @override
  Future<void> onLoad() async {
    // Tout le code de jeu viendra ici !
  }
}
