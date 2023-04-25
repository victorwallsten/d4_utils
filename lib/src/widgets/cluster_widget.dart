import 'package:d4_utils/src/data_structures/skill.dart';
import 'package:d4_utils/src/data_structures/tree.dart';
import 'package:d4_utils/src/enums/barbarian_cluster.dart';
import 'package:d4_utils/src/utils/enum_utils.dart';
import 'package:d4_utils/src/widgets/skill_tree_widget.dart';
import 'package:flutter/material.dart';

class ClusterWidget extends StatefulWidget {
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
  State<ClusterWidget> createState() => _ClusterWidgetState();
}

class _ClusterWidgetState extends State<ClusterWidget> {
  Tree<Enum> _cluster = Tree(element: BarbarianCluster.Basic);
  Map<Enum, Skill> _skills = {};

  @override
  void initState() {
    _cluster = widget.cluster;
    _skills = widget.skills;
    super.initState();
  }

  @override
  Widget build(BuildContext context) => ExpansionTile(
        shape: Theme.of(context).expansionTileTheme.shape,
        childrenPadding: Theme.of(context).expansionTileTheme.childrenPadding,
        title: Text(
          '${EnumUtils.enumToNameWithSpaces(_cluster.element)}'
          ' (${_skills[_cluster.element]?.assignedSkillPoints ?? 0})',
        ),
        children: _cluster.children
            .map((child) => SkillTreeWidget(
                  parent: _cluster.element,
                  isClusterUnlocked: widget.isClusterUnlocked,
                  isClusterDecrementable: widget.isClusterDecrementable,
                  skill: child,
                  skills: _skills,
                  incrementCallback: (Enum e) => setState(
                      () => widget.incrementCallback({_cluster.element, e})),
                  decrementCallback: (Enum e) => setState(
                      () => widget.decrementCallback({_cluster.element, e})),
                ))
            .toList(growable: false),
      );
}
