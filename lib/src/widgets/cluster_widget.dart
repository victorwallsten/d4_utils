import 'package:d4_utils/src/data_structures/pair.dart';
import 'package:d4_utils/src/data_structures/tree.dart';
import 'package:d4_utils/src/enums/barbarian_cluster.dart';
import 'package:d4_utils/src/utils/enum_utils.dart';
import 'package:d4_utils/src/widgets/skill_tree_widget.dart';
import 'package:flutter/material.dart';

class ClusterWidget extends StatefulWidget {
  const ClusterWidget({
    super.key,
    required this.clusterTree,
    required this.isIncrementable,
    required this.isDecrementable,
    required this.incrementCallback,
    required this.decrementCallback,
  });

  final Tree<Pair<Enum, int>> clusterTree;
  final bool isIncrementable;
  final bool isDecrementable;
  final VoidCallback incrementCallback;
  final VoidCallback decrementCallback;

  @override
  State<ClusterWidget> createState() => _ClusterWidgetState();
}

class _ClusterWidgetState extends State<ClusterWidget> {
  Tree<Pair<Enum, int>> _clusterTree =
      Tree(element: Pair(BarbarianCluster.Basic, 0));

  @override
  void initState() {
    _clusterTree = widget.clusterTree;
    super.initState();
  }

  @override
  Widget build(BuildContext context) => ExpansionTile(
        shape: Theme.of(context).expansionTileTheme.shape,
        childrenPadding: Theme.of(context).expansionTileTheme.childrenPadding,
        title: Text(
          '${EnumUtils.enumToNameWithSpaces(_clusterTree.element.fst)}'
          ' (${_clusterTree.element.snd})',
        ),
        children: _clusterTree.children
            .map((child) => SkillTreeWidget(
                  skillTree: child,
                  isIncrementable: widget.isIncrementable,
                  isDecrementable: widget.isDecrementable,
                  incrementCallback: () {
                    setState(() => _clusterTree.element.snd++);
                    widget.incrementCallback();
                  },
                  decrementCallback: () {
                    setState(() => _clusterTree.element.snd--);
                    widget.decrementCallback();
                  },
                ))
            .toList(growable: false),
      );
}
