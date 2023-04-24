import 'package:d4_utils/src/data_structures/skill.dart';
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

  final Tree<Skill> characterClassTree;

  @override
  State<CharacterClassWidget> createState() => _CharacterClassWidgetState();
}

class _CharacterClassWidgetState extends State<CharacterClassWidget> {
  Tree<Skill> _characterClassTree =
      Tree(element: Skill(CharacterClass.Barbarian));

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

  bool _isDecrementable(Skill cluster, Iterable<Skill> clusters) {
    int runningSum = 0;
    if (cluster.assignedSkillPoints == 0 || clusters.isEmpty) {
      return false;
    }
    Iterable<Skill> clustersWithPoints =
        clusters.where((element) => element.assignedSkillPoints > 0);
    runningSum = clustersWithPoints
        .takeWhile((value) => value.e.index <= cluster.e.index)
        .fold(0, (b, a) => b + a.assignedSkillPoints);
    for (Skill c in clustersWithPoints
        .skipWhile((value) => value.e.index <= cluster.e.index)) {
      if (runningSum <= _thresholdOf(c.e)) {
        return false;
      }
      runningSum += c.assignedSkillPoints;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) => ListView(
        children: <Widget>[
              ListTile(
                title: Text(
                  '${EnumUtils.enumToNameWithSpaces(_characterClassTree.element.e)}'
                  ' total: ${_characterClassTree.element.assignedSkillPoints}',
                ),
              ),
            ] +
            _characterClassTree.children
                .map((child) => ClusterWidget(
                      clusterTree: child,
                      isIncrementable:
                          _characterClassTree.element.assignedSkillPoints >=
                              _thresholdOf(child.element.e),
                      isDecrementable: _isDecrementable(
                        child.element,
                        _characterClassTree.children.map((c) => c.element),
                      ),
                      incrementCallback: () => setState(() =>
                          _characterClassTree.element.assignedSkillPoints++),
                      decrementCallback: () => setState(() =>
                          _characterClassTree.element.assignedSkillPoints--),
                    ))
                .toList(growable: false),
      );
}
