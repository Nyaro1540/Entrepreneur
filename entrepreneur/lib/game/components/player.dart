import 'package:flame/components.dart';

class Player extends SpriteComponent with HasGameRef {
  @override
  Future<void> onLoad() async {
    sprite = await gameRef.loadSprite('assets/images/characters/player.png');
    size = Vector2(32, 32);
    position = Vector2(100, 100);
  }

  // Ajoutez ici la logique de déplacement (keyboard/joystick)
}
