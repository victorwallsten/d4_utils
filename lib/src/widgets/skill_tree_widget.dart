import 'package:d4_utils/src/character_classes/barbarian.dart';
import 'package:d4_utils/src/character_classes/druid.dart';
import 'package:d4_utils/src/character_classes/necromancer.dart';
import 'package:d4_utils/src/character_classes/rogue.dart';
import 'package:d4_utils/src/character_classes/sorcerer.dart';
import 'package:d4_utils/src/data_structures/skill.dart';
import 'package:d4_utils/src/data_structures/tree.dart';
import 'package:d4_utils/src/enums/barbarian_cluster.dart';
import 'package:d4_utils/src/enums/barbarian_skill.dart';
import 'package:d4_utils/src/enums/druid_cluster.dart';
import 'package:d4_utils/src/enums/druid_skill.dart';
import 'package:d4_utils/src/enums/necromancer_cluster.dart';
import 'package:d4_utils/src/enums/necromancer_skill.dart';
import 'package:d4_utils/src/enums/rogue_cluster.dart';
import 'package:d4_utils/src/enums/rogue_skill.dart';
import 'package:d4_utils/src/enums/skill_type.dart';
import 'package:d4_utils/src/enums/sorcerer_cluster.dart';
import 'package:d4_utils/src/enums/sorcerer_skill.dart';
import 'package:d4_utils/src/utils/enum_utils.dart';
import 'package:d4_utils/src/widgets/skill_widget.dart';
import 'package:flutter/material.dart';

class SkillTreeWidget extends StatefulWidget {
  const SkillTreeWidget({
    super.key,
    required this.parent,
    required this.isClusterUnlocked,
    required this.isClusterDecrementable,
    required this.skill,
    required this.skills,
    required this.incrementCallback,
    required this.decrementCallback,
  });

  final Enum parent;
  final bool isClusterUnlocked;
  final bool isClusterDecrementable;
  final Tree<Enum> skill;
  final Map<Enum, Skill> skills;
  final Function(Enum) incrementCallback;
  final Function(Enum) decrementCallback;

  @override
  State<SkillTreeWidget> createState() => _SkillTreeWidgetState();
}

class _SkillTreeWidgetState extends State<SkillTreeWidget> {
  Tree<Enum> _skill = Tree(element: BarbarianSkill.Bash);
  Map<Enum, Skill> _skills = {};

  @override
  void initState() {
    _skill = widget.skill;
    _skills = widget.skills;
    super.initState();
  }

  Enum _clusterOf(Enum e) {
    if (e is BarbarianSkill) {
      return Barbarian.clusterOf(e);
    } else if (e is DruidSkill) {
      return Druid.clusterOf(e);
    } else if (e is NecromancerSkill) {
      return Necromancer.clusterOf(e);
    } else if (e is RogueSkill) {
      return Rogue.clusterOf(e);
    } else if (e is SorcererSkill) {
      return Sorcerer.clusterOf(e);
    } else {
      assert(false, 'cluster of $e missing');
      return BarbarianCluster.Basic;
    }
  }

  SkillType _skillTypeOf(Enum e) {
    if (e is BarbarianSkill) {
      return Barbarian.skillTypeOf(e);
    } else if (e is DruidSkill) {
      return Druid.skillTypeOf(e);
    } else if (e is NecromancerSkill) {
      return Necromancer.skillTypeOf(e);
    } else if (e is RogueSkill) {
      return Rogue.skillTypeOf(e);
    } else if (e is SorcererSkill) {
      return Sorcerer.skillTypeOf(e);
    } else {
      assert(false, 'skillType of $e missing');
      return SkillType.Active;
    }
  }

  int _maxAssignedOf(Enum e) {
    SkillType skillType = _skillTypeOf(e);
    Enum cluster = _clusterOf(e);

    switch (cluster) {
      case BarbarianCluster.Ultimate:
      case BarbarianCluster.KeyPassive:
      case DruidCluster.Ultimate:
      case DruidCluster.KeyPassive:
      case NecromancerCluster.Ultimate:
      case NecromancerCluster.KeyPassive:
      case RogueCluster.Ultimate:
      case RogueCluster.KeyPassive:
      case SorcererCluster.Ultimate:
      case SorcererCluster.KeyPassive:
        return 1;
    }

    switch (skillType) {
      case SkillType.Active:
        return 5;
      case SkillType.Passive:
        return 3;
      case SkillType.Enhancement:
      case SkillType.Upgrade:
        return 1;
    }
  }

  bool _isNotCluster(Enum e) => !(e is BarbarianCluster ||
      e is DruidCluster ||
      e is NecromancerCluster ||
      e is RogueCluster ||
      e is SorcererCluster);

  bool get _parentsThresholdIsMet {
    switch (_skill.element) {
      case BarbarianSkill.ExposeVulnerability:
        return (_skills[BarbarianSkill.NoMercy]?.assignedSkillPoints ?? 0) >
                0 ||
            (_skills[BarbarianSkill.SlayingStrike]?.assignedSkillPoints ?? 0) >
                0;
      case BarbarianSkill.BruteForce:
        return (_skills[BarbarianSkill.HeavyHanded]?.assignedSkillPoints ?? 0) >
                0 ||
            (_skills[BarbarianSkill.Wallop]?.assignedSkillPoints ?? 0) > 0;
      case DruidSkill.BadOmen:
        return (_skills[DruidSkill.ChargedAtmosphere]?.assignedSkillPoints ??
                    0) >
                0 ||
            (_skills[DruidSkill.EndlessTempest]?.assignedSkillPoints ?? 0) > 0;
      case DruidSkill.Unrestrained:
        return (_skills[DruidSkill.ThickHide]?.assignedSkillPoints ?? 0) > 0 ||
            (_skills[DruidSkill.NaturesResolve]?.assignedSkillPoints ?? 0) > 0;
      case DruidSkill.Resonance:
        return (_skills[DruidSkill.NaturalDisaster]?.assignedSkillPoints ?? 0) >
                0 ||
            (_skills[DruidSkill.CircleOfLife]?.assignedSkillPoints ?? 0) > 0;
      case NecromancerSkill.TidesOfBlood:
        return (_skills[NecromancerSkill.Transfusion]?.assignedSkillPoints ??
                    0) >
                0 ||
            (_skills[NecromancerSkill.CoalescedBlood]?.assignedSkillPoints ??
                    0) >
                0;
      case NecromancerSkill.Evulsion:
        return (_skills[NecromancerSkill.CompoundFracture]
                        ?.assignedSkillPoints ??
                    0) >
                0 ||
            (_skills[NecromancerSkill.RapidOssification]?.assignedSkillPoints ??
                    0) >
                0;
      case NecromancerSkill.Terror:
        return (_skills[NecromancerSkill.Gloom]?.assignedSkillPoints ?? 0) >
                0 ||
            (_skills[NecromancerSkill.CripplingDarkness]?.assignedSkillPoints ??
                    0) >
                0;
      case RogueSkill.TrickAttacks:
        return (_skills[RogueSkill.Concussive]?.assignedSkillPoints ?? 0) > 0 ||
            (_skills[RogueSkill.RapidGambits]?.assignedSkillPoints ?? 0) > 0;
      case SorcererSkill.FrigidBreeze:
        return (_skills[SorcererSkill.Hoarfrost]?.assignedSkillPoints ?? 0) >
                0 ||
            (_skills[SorcererSkill.IcyTouch]?.assignedSkillPoints ?? 0) > 0;
      case SorcererSkill.Warmth:
        return (_skills[SorcererSkill.EndlessPyre]?.assignedSkillPoints ?? 0) >
                0 ||
            (_skills[SorcererSkill.Soulfire]?.assignedSkillPoints ?? 0) > 0;
      case SorcererSkill.Convulsions:
        return (_skills[SorcererSkill.Conduction]?.assignedSkillPoints ?? 0) >
                0 ||
            (_skills[SorcererSkill.Electrocution]?.assignedSkillPoints ?? 0) >
                0;
      default:
        if (_isNotCluster(widget.parent)) {
          return (_skills[widget.parent]?.assignedSkillPoints ?? 0) > 0;
        } else {
          return true;
        }
    }
  }

  bool get _isDecrementable =>
      widget.isClusterDecrementable &&
      ((_skills[_skill.element]?.assignedSkillPoints ?? 0) > 1 ||
          (_skills[_skill.element]?.assignedSkillPoints ?? 0) == 1 &&
              _skill.children.fold(
                      0,
                      (b, a) =>
                          b +
                          a.fold(
                              0,
                              (d, c) =>
                                  d +
                                  (_skills[c]?.assignedSkillPoints ?? 0))) ==
                  0);

  bool get _isIncrementable =>
      widget.isClusterUnlocked &&
      (_skills[_skill.element]?.assignedSkillPoints ?? 0) <
          _maxAssignedOf(_skill.element) &&
      _parentsThresholdIsMet;

  @override
  Widget build(BuildContext context) => ExpansionTile(
        shape: Theme.of(context).expansionTileTheme.shape,
        childrenPadding: Theme.of(context).expansionTileTheme.childrenPadding,
        title: Text(EnumUtils.enumToNameWithSpaces(_skill.element)),
        trailing: SkillWidget(
          _skill.element,
          level: _skills[_skill.element]?.assignedSkillPoints ?? 0,
          onMinusPressed: () {
            if (_isDecrementable) {
              setState(() {
                widget.decrementCallback(_skill.element);
              });
            }
          },
          onPlusPressed: () {
            if (_isIncrementable) {
              setState(() {
                widget.incrementCallback(_skill.element);
              });
            }
          },
        ),
        children: _skill.children
            .map(
              (child) => SkillTreeWidget(
                parent: _skill.element,
                isClusterUnlocked: widget.isClusterUnlocked,
                isClusterDecrementable: widget.isClusterDecrementable,
                skill: child,
                skills: _skills,
                incrementCallback: widget.incrementCallback,
                decrementCallback: widget.decrementCallback,
              ),
            )
            .toList(growable: false),
      );
}
