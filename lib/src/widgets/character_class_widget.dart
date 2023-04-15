import 'package:d4_utils/src/data_structures/pair.dart';
import 'package:d4_utils/src/data_structures/tree.dart';
import 'package:d4_utils/src/enums/barbarian_cluster.dart';
import 'package:d4_utils/src/enums/character_class.dart';
import 'package:d4_utils/src/utils/enum_utils.dart';
import 'package:d4_utils/src/widgets/cluster_widget.dart';
import 'package:flutter/material.dart';

class CharacterClassWidget extends StatefulWidget {
  const CharacterClassWidget({
    super.key,
    required this.characterClassTree,
  });

  final Tree<Pair<Enum, int>> characterClassTree;

  @override
  State<CharacterClassWidget> createState() => _CharacterClassWidgetState();
}

class _CharacterClassWidgetState extends State<CharacterClassWidget> {
  Tree<Pair<Enum, int>> _characterClassTree =
      Tree(element: Pair(CharacterClass.Barbarian, 0));

  @override
  void initState() {
    _characterClassTree = widget.characterClassTree;
    super.initState();
  }

  bool _isUnlocked(Enum cluster, int level) {
    switch (cluster) {
      case BarbarianCluster.Basic:
        return true;
      case BarbarianCluster.Core:
        return level >= 2;
      case BarbarianCluster.Defensive:
        return level >= 6;
      case BarbarianCluster.Brawling:
        return level >= 11;
      case BarbarianCluster.WeaponMastery:
        return level >= 16;
      case BarbarianCluster.Ultimate:
        return level >= 23;
      case BarbarianCluster.KeyPassive:
        return level >= 33;
      default:
        assert(false, 'case for $cluster missing');
        return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    Enum characterClass = _characterClassTree.element.key;
    int level = _characterClassTree.element.value;
    return ListView(
      children: <Widget>[
            ListTile(
              title: Text(
                '${EnumUtils.enumToNameWithSpaces(characterClass)}'
                ' total: $level',
              ),
            ),
          ] +
          _characterClassTree.children
              .map((child) => ClusterWidget(
                    clusterTree: child,
                    callback: (delta) {
                      if (level + delta >= 0) {
                        setState(() {
                          _characterClassTree.element.value += delta;
                        });
                      }
                    },
                    isUnlocked: _isUnlocked(child.element.key, level),
                  ))
              .toList(growable: false),
    );
  }
}
