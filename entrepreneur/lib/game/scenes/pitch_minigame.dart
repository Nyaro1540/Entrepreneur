import 'package:flame/components.dart';
import 'package:entrepreneur_quest/game/components/player.dart';
import 'package:entrepreneur_quest/game/components/npc.dart';

class MainScene extends Component with HasGameRef {
  @override
  Future<void> onLoad() async {
    final player = Player();
    final investor = Npc(type: NpcType.investor, position: Vector2(300, 200));
    add(player);
    add(investor);
  }
}
