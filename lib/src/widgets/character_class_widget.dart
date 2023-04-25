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
    required this.characterClass,
    required this.skills,
  });

  final Tree<Enum> characterClass;
  final Map<Enum, Skill> skills;

  @override
  State<CharacterClassWidget> createState() => _CharacterClassWidgetState();
}

class _CharacterClassWidgetState extends State<CharacterClassWidget> {
  Tree<Enum> _characterClass = Tree(element: CharacterClass.Barbarian);
  Map<Enum, Skill> _skills = {};

  @override
  void initState() {
    _characterClass = widget.characterClass;
    _skills = widget.skills;
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
      (_skills[_characterClass.element]?.assignedSkillPoints ?? 0) >=
      _thresholdOf(cluster);

  bool _isClusterDecrementable(Enum cluster) {
    Iterable<Enum> clusters =
        _characterClass.children.map((child) => child.element);
    int runningSum = 0;
    if ((_skills[cluster]?.assignedSkillPoints ?? 0) == 0 || clusters.isEmpty) {
      return false;
    }
    Iterable<Enum> clustersWithPoints = clusters
        .where((element) => (_skills[element]?.assignedSkillPoints ?? 0) > 0);
    runningSum = clustersWithPoints
        .takeWhile((value) => value.index <= cluster.index)
        .fold(0, (b, a) => b + (_skills[a]?.assignedSkillPoints ?? 0));
    for (Enum e in clustersWithPoints
        .skipWhile((value) => value.index <= cluster.index)) {
      if (runningSum <= _thresholdOf(e)) {
        return false;
      }
      runningSum += (_skills[e]?.assignedSkillPoints ?? 0);
    }
    return true;
  }

  @override
  Widget build(BuildContext context) => ListView(
        children: <Widget>[
              ListTile(
                title: Text(
                  '${EnumUtils.enumToNameWithSpaces(_characterClass.element)} total:'
                  ' ${_skills[_characterClass.element]?.assignedSkillPoints ?? 0}',
                ),
              ),
            ] +
            _characterClass.children
                .map((child) => ClusterWidget(
                      parent: _characterClass.element,
                      cluster: child,
                      skills: _skills,
                      isClusterUnlocked: _isClusterUnlocked(child.element),
                      isClusterDecrementable:
                          _isClusterDecrementable(child.element),
                      incrementCallback: (Set<Enum> es) => setState(() {
                        _skills[_characterClass.element]?.assignedSkillPoints++;
                        for (Enum e in es) {
                          _skills[e]?.assignedSkillPoints++;
                        }
                      }),
                      decrementCallback: (Set<Enum> es) => setState(() {
                        _skills[_characterClass.element]?.assignedSkillPoints--;
                        for (Enum e in es) {
                          _skills[e]?.assignedSkillPoints--;
                        }
                      }),
                    ))
                .toList(growable: false),
      );
}
