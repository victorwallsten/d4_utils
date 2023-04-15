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
    this.callback,
    this.isUnlocked = true,
  });

  final Tree<Pair<Enum, int>> clusterTree;
  final Function(int delta)? callback;
  final bool isUnlocked;

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
  Widget build(BuildContext context) {
    Enum cluster = _clusterTree.element.key;
    int level = _clusterTree.element.value;
    return ExpansionTile(
      shape: const Border(),
      childrenPadding: const EdgeInsets.only(left: 20),
      title: Text(
        '${EnumUtils.enumToNameWithSpaces(cluster)}'
        ' ($level)',
      ),
      children: _clusterTree.children
          .map((child) => SkillTreeWidget(
                skillTree: child,
                callback: (delta) {
                  if (level + delta >= 0) {
                    setState(() {
                      _clusterTree.element.value += delta;
                    });
                    widget.callback?.call(delta);
                  }
                },
                isUnlocked: widget.isUnlocked,
              ))
          .toList(growable: false),
    );
  }
}
