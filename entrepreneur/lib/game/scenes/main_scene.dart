import 'package:flame/components.dart';
import 'package:entrepreneur/game/components/player.dart';

enum NpcType { investor, customer, partner }

class Npc extends Component {
  final NpcType type;
  final Vector2 position;

  Npc({required this.type, required this.position});
}

class MainScene extends Component with HasGameRef {
  @override
  Future<void> onLoad() async {
    final player = Player();
    final investor = Npc(type: NpcType.investor, position: Vector2(300, 200));
    add(player);
    add(investor);
  }
}
