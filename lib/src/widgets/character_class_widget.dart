import 'package:d4_utils/src/data_structures/pair.dart';
import 'package:d4_utils/src/data_structures/tree.dart';
import 'package:d4_utils/src/enums/barbarian_cluster.dart';
import 'package:d4_utils/src/enums/character_class.dart';
import 'package:d4_utils/src/enums/druid_cluster.dart';
import 'package:d4_utils/src/enums/necromancer_cluster.dart';
import 'package:d4_utils/src/enums/rogue_cluster.dart';
import 'package:d4_utils/src/enums/sorcerer_cluster.dart';
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

  int _thresholdOf(Enum cluster) {
    switch (cluster) {
      case BarbarianCluster.Basic:
      case DruidCluster.Basic:
      case NecromancerCluster.Basic:
      case RogueCluster.Basic:
      case SorcererCluster.Basic:
        return 0;
      case BarbarianCluster.Core:
      case DruidCluster.Core:
      case NecromancerCluster.Core:
      case RogueCluster.Core:
      case SorcererCluster.Core:
        return 2;
      case BarbarianCluster.Defensive:
      case DruidCluster.Defensive:
      case NecromancerCluster.FirstCorpseAndMacabre:
      case RogueCluster.Agility:
      case SorcererCluster.Defensive:
        return 6;
      case BarbarianCluster.Brawling:
      case DruidCluster.Companion:
      case NecromancerCluster.Curse:
      case RogueCluster.Subterfuge:
      case SorcererCluster.Conjuration:
        return 11;
      case BarbarianCluster.WeaponMastery:
      case DruidCluster.Wrath:
      case NecromancerCluster.SecondCorpseAndMacabre:
      case RogueCluster.Imbuement:
      case SorcererCluster.Mastery:
        return 16;
      case BarbarianCluster.Ultimate:
      case DruidCluster.Ultimate:
      case NecromancerCluster.Ultimate:
      case RogueCluster.Ultimate:
      case SorcererCluster.Ultimate:
        return 23;
      case BarbarianCluster.KeyPassive:
      case DruidCluster.KeyPassive:
      case NecromancerCluster.KeyPassive:
      case RogueCluster.KeyPassive:
      case SorcererCluster.KeyPassive:
        return 33;
      default:
        assert(false, 'case for $cluster missing');
        return 0;
    }
  }

  bool _isDecrementable(
      Pair<Enum, int> cluster, Iterable<Pair<Enum, int>> clusters) {
    int runningSum = 0;
    if (cluster.snd == 0 || clusters.isEmpty) {
      return false;
    }
    Iterable<Pair<Enum, int>> clustersWithPoints =
        clusters.where((element) => element.snd > 0);
    runningSum = clustersWithPoints
        .takeWhile((value) => value.fst.index <= cluster.fst.index)
        .fold(0, (b, a) => b + a.snd);
    for (Pair<Enum, int> c in clustersWithPoints
        .skipWhile((value) => value.fst.index <= cluster.fst.index)) {
      if (runningSum <= _thresholdOf(c.fst)) {
        return false;
      }
      runningSum += c.snd;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) => ListView(
        children: <Widget>[
              ListTile(
                title: Text(
                  '${EnumUtils.enumToNameWithSpaces(_characterClassTree.element.fst)}'
                  ' total: ${_characterClassTree.element.snd}',
                ),
              ),
            ] +
            _characterClassTree.children
                .map((child) => ClusterWidget(
                      clusterTree: child,
                      isIncrementable: _characterClassTree.element.snd >=
                          _thresholdOf(child.element.fst),
                      isDecrementable: _isDecrementable(
                        child.element,
                        _characterClassTree.children.map((c) => c.element),
                      ),
                      incrementCallback: () =>
                          setState(() => _characterClassTree.element.snd++),
                      decrementCallback: () =>
                          setState(() => _characterClassTree.element.snd--),
                    ))
                .toList(growable: false),
      );
}
