import 'package:d4_utils/src/data_structures/skill.dart';
import 'package:d4_utils/src/data_structures/tree.dart';
import 'package:d4_utils/src/utils/enum_utils.dart';
import 'package:d4_utils/src/widgets/skill_widget.dart';
import 'package:flutter/material.dart';

class ClusterWidget extends StatelessWidget {
  const ClusterWidget({
    super.key,
    required this.parent,
    required this.skillTree,
    required this.skillMap,
    required this.isClusterUnlocked,
    required this.isClusterDecrementable,
    required this.incrementCallback,
    required this.decrementCallback,
  });

  final Enum parent;
  final Tree<Enum> skillTree;
  final Map<Enum, Skill> skillMap;
  final bool isClusterUnlocked;
  final bool isClusterDecrementable;
  final Function(Set<Enum>) incrementCallback;
  final Function(Set<Enum>) decrementCallback;

  @override
  Widget build(BuildContext context) => ExpansionTile(
        shape: Theme.of(context).expansionTileTheme.shape,
        childrenPadding: Theme.of(context).expansionTileTheme.childrenPadding,
        title: Text(
          '${EnumUtils.enumToNameWithSpaces(skillTree.element)}'
          ' (${skillMap[skillTree.element]?.assignedSkillPoints ?? 0})',
        ),
        children: skillTree.children
            .map((child) => SkillWidget(
                  parent: skillTree.element,
                  isClusterUnlocked: isClusterUnlocked,
                  isClusterDecrementable: isClusterDecrementable,
                  skillTree: child,
                  skillMap: skillMap,
                  incrementCallback: (Enum e) =>
                      incrementCallback({skillTree.element, e}),
                  decrementCallback: (Enum e) =>
                      decrementCallback({skillTree.element, e}),
                ))
            .toList(growable: false),
      );
}
