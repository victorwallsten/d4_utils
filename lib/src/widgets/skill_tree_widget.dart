import 'package:d4_utils/src/data_structures/skill.dart';
import 'package:d4_utils/src/data_structures/tree.dart';
import 'package:d4_utils/src/enums/barbarian_skill.dart';
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
            if (widget.isIncrementable) {
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
