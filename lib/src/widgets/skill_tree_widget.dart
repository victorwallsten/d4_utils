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
    required this.skillTree,
    required this.isIncrementable,
    required this.isDecrementable,
    required this.incrementCallback,
    required this.decrementCallback,
  });

  final Tree<Skill> skillTree;
  final bool isIncrementable;
  final bool isDecrementable;
  final VoidCallback incrementCallback;
  final VoidCallback decrementCallback;

  @override
  State<SkillTreeWidget> createState() => _SkillTreeWidgetState();
}

class _SkillTreeWidgetState extends State<SkillTreeWidget> {
  Tree<Skill> _skillTree = Tree(element: Skill(BarbarianSkill.Bash));

  @override
  void initState() {
    _skillTree = widget.skillTree;
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

  @override
  Widget build(BuildContext context) => ExpansionTile(
        shape: Theme.of(context).expansionTileTheme.shape,
        childrenPadding: Theme.of(context).expansionTileTheme.childrenPadding,
        title: Text(EnumUtils.enumToNameWithSpaces(_skillTree.element.e)),
        trailing: SkillWidget(
          _skillTree.element.e,
          level: _skillTree.element.assignedSkillPoints,
          onMinusPressed: () {
            if (widget.isDecrementable &&
                (_skillTree.element.assignedSkillPoints > 1 ||
                    _skillTree.element.assignedSkillPoints == 1 &&
                        _skillTree.children.fold(
                                0,
                                (b, a) =>
                                    b +
                                    a.fold(0,
                                        (d, c) => d + c.assignedSkillPoints)) ==
                            0)) {
              setState(() => _skillTree.element.assignedSkillPoints--);
              widget.decrementCallback();
            }
          },
          onPlusPressed: () {
            if (widget.isIncrementable &&
                _skillTree.element.assignedSkillPoints <
                    _maxAssignedOf(_skillTree.element.e)) {
              setState(() => _skillTree.element.assignedSkillPoints++);
              widget.incrementCallback();
            }
          },
        ),
        children: _skillTree.children
            .map(
              (child) => SkillTreeWidget(
                skillTree: child,
                isIncrementable: widget.isIncrementable &&
                    _skillTree.element.assignedSkillPoints > 0,
                isDecrementable: widget.isDecrementable,
                incrementCallback: widget.incrementCallback,
                decrementCallback: widget.decrementCallback,
              ),
            )
            .toList(growable: false),
      );
}
