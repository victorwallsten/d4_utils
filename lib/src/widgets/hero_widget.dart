import 'package:d4_utils/src/data_structures/skill.dart';
import 'package:d4_utils/src/data_structures/tree.dart';
import 'package:d4_utils/src/enums/barbarian_cluster.dart';
import 'package:d4_utils/src/enums/hero.dart' as hero;
import 'package:d4_utils/src/enums/druid_cluster.dart';
import 'package:d4_utils/src/enums/necromancer_cluster.dart';
import 'package:d4_utils/src/enums/rogue_cluster.dart';
import 'package:d4_utils/src/enums/sorcerer_cluster.dart';
import 'package:d4_utils/src/utils/enum_utils.dart';
import 'package:d4_utils/src/widgets/cluster_widget.dart';
import 'package:flutter/material.dart';

class HeroWidget extends StatefulWidget {
  const HeroWidget({
    super.key,
    required this.skillTree,
    required this.skillMap,
  });

  final Tree<Enum> skillTree;
  final Map<Enum, Skill> skillMap;

  @override
  State<HeroWidget> createState() => _HeroWidgetState();
}

class _HeroWidgetState extends State<HeroWidget> {
  Tree<Enum> _skillTree = Tree(element: hero.Hero.Barbarian);
  Map<Enum, Skill> _skillMap = {};

  @override
  void initState() {
    _skillTree = widget.skillTree;
    _skillMap = widget.skillMap;
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

  bool _isClusterUnlocked(Enum cluster) =>
      (_skillMap[_skillTree.element]?.assignedSkillPoints ?? 0) >=
      _thresholdOf(cluster);

  bool _isClusterDecrementable(Enum cluster) {
    Iterable<Enum> clusters = _skillTree.children.map((child) => child.element);
    int runningSum = 0;
    if ((_skillMap[cluster]?.assignedSkillPoints ?? 0) == 0 ||
        clusters.isEmpty) {
      return false;
    }
    Iterable<Enum> clustersWithPoints = clusters
        .where((element) => (_skillMap[element]?.assignedSkillPoints ?? 0) > 0);
    runningSum = clustersWithPoints
        .takeWhile((value) => value.index <= cluster.index)
        .fold(0, (b, a) => b + (_skillMap[a]?.assignedSkillPoints ?? 0));
    for (Enum e in clustersWithPoints
        .skipWhile((value) => value.index <= cluster.index)) {
      if (runningSum <= _thresholdOf(e)) {
        return false;
      }
      runningSum += (_skillMap[e]?.assignedSkillPoints ?? 0);
    }
    return true;
  }

  @override
  Widget build(BuildContext context) => ListView(
        children: <Widget>[
              ListTile(
                title: Text(
                  '${EnumUtils.enumToNameWithSpaces(_skillTree.element)} total:'
                  ' ${_skillMap[_skillTree.element]?.assignedSkillPoints ?? 0}',
                ),
              ),
            ] +
            _skillTree.children
                .map((child) => ClusterWidget(
                      parent: _skillTree.element,
                      skillTree: child,
                      skillMap: _skillMap,
                      isClusterUnlocked: _isClusterUnlocked(child.element),
                      isClusterDecrementable:
                          _isClusterDecrementable(child.element),
                      incrementCallback: (Set<Enum> es) => setState(() {
                        _skillMap[_skillTree.element]?.assignedSkillPoints++;
                        for (Enum e in es) {
                          _skillMap[e]?.assignedSkillPoints++;
                        }
                      }),
                      decrementCallback: (Set<Enum> es) => setState(() {
                        _skillMap[_skillTree.element]?.assignedSkillPoints--;
                        for (Enum e in es) {
                          _skillMap[e]?.assignedSkillPoints--;
                        }
                      }),
                    ))
                .toList(growable: false),
      );
}
