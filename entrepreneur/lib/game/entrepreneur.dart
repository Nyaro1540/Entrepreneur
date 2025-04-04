import 'package:flame/game.dart';
import 'package:entrepreneur/game/scenes/main_scene.dart';

class EntrepreneurGame extends FlameGame {
  @override
  Future<void> onLoad() async {
    await add(MainScene()); // Charge la scène principale
  }
}
