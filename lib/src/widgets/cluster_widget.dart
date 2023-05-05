import 'package:d4_utils/src/data_structures/skill.dart';
import 'package:d4_utils/src/data_structures/tree.dart';
import 'package:d4_utils/src/utils/enum_utils.dart';
import 'package:d4_utils/src/widgets/skill_tree_widget.dart';
import 'package:flutter/material.dart';

class ClusterWidget extends StatelessWidget {
  const ClusterWidget({
    super.key,
    required this.parent,
    required this.cluster,
    required this.skills,
    required this.isClusterUnlocked,
    required this.isClusterDecrementable,
    required this.incrementCallback,
    required this.decrementCallback,
  });

  final Enum parent;
  final Tree<Enum> cluster;
  final Map<Enum, Skill> skills;
  final bool isClusterUnlocked;
  final bool isClusterDecrementable;
  final Function(Set<Enum>) incrementCallback;
  final Function(Set<Enum>) decrementCallback;

  @override
  Widget build(BuildContext context) => ExpansionTile(
        shape: Theme.of(context).expansionTileTheme.shape,
        childrenPadding: Theme.of(context).expansionTileTheme.childrenPadding,
        title: Text(
          '${EnumUtils.enumToNameWithSpaces(cluster.element)}'
          ' (${skills[cluster.element]?.assignedSkillPoints ?? 0})',
        ),
        children: cluster.children
            .map((child) => SkillTreeWidget(
                  parent: cluster.element,
                  isClusterUnlocked: isClusterUnlocked,
                  isClusterDecrementable: isClusterDecrementable,
                  skill: child,
                  skills: skills,
                  incrementCallback: (Enum e) =>
                      incrementCallback({cluster.element, e}),
                  decrementCallback: (Enum e) =>
                      decrementCallback({cluster.element, e}),
                ))
            .toList(growable: false),
      );
}
