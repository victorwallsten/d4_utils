import 'package:d4_utils/src/data_structures/pair.dart';
import 'package:d4_utils/src/data_structures/tree.dart';
import 'package:d4_utils/src/enums/necromancer_cluster.dart';
import 'package:d4_utils/src/enums/necromancer_skill.dart';
import 'package:d4_utils/src/enums/character_class.dart';

abstract class Necromancer {
  static Tree<Pair<Enum, int>> _tree(
          Enum e, List<Tree<Pair<Enum, int>>> children) =>
      Tree(element: Pair(e, 0), children: children);

  static List<Tree<Pair<Enum, int>>> get _childless => const [];
}
