import 'package:d4_utils/src/data_structures/pair.dart';
import 'package:d4_utils/src/data_structures/tree.dart';
import 'package:d4_utils/src/enums/barbarian_skill.dart';
import 'package:d4_utils/src/utils/enum_utils.dart';
import 'package:d4_utils/src/widgets/skill_widget.dart';
import 'package:flutter/material.dart';

class SkillTreeWidget extends StatefulWidget {
  const SkillTreeWidget({
    super.key,
    required this.skillTree,
    this.callback,
    this.isUnlocked = true,
  });

  final Tree<Pair<Enum, int>> skillTree;
  final Function(int delta)? callback;
  final bool isUnlocked;

  @override
  State<SkillTreeWidget> createState() => _SkillTreeWidgetState();
}

class _SkillTreeWidgetState extends State<SkillTreeWidget> {
  Tree<Pair<Enum, int>> _skillTree =
      Tree(element: Pair(BarbarianSkill.Bash, 0));

  @override
  void initState() {
    _skillTree = widget.skillTree;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Enum e = _skillTree.element.key;
    int level = _skillTree.element.value;
    return ExpansionTile(
      shape: const Border(),
      childrenPadding: const EdgeInsets.only(left: 20),
      title: Text(EnumUtils.enumToNameWithSpaces(e)),
      trailing: SkillWidget(
        e,
        level: level,
        onMinusPressed: () {
          if (widget.isUnlocked && level > 0) {
            if (level == 1 &&
                _skillTree.children.fold(
                        0, (b, a) => b + a.fold(0, (d, c) => d + c.value)) >
                    0) {
              return;
            }
            setState(() {
              _skillTree.element.value--;
            });
            widget.callback?.call(-1);
          }
        },
        onPlusPressed: () {
          if (widget.isUnlocked) {
            setState(() {
              _skillTree.element.value++;
            });
            widget.callback?.call(1);
          }
        },
      ),
      children: _skillTree.children
          .map(
            (child) => SkillTreeWidget(
              skillTree: child,
              callback: widget.callback,
              isUnlocked: level > 0,
            ),
          )
          .toList(growable: false),
    );
  }
}
