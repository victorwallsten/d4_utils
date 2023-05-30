import 'package:d4_utils/src/data_structures/skill.dart';
import 'package:d4_utils/src/data_structures/tree.dart';
import 'package:d4_utils/src/utils/enum_utils.dart';
import 'package:d4_utils/src/widgets/skill_widget.dart';
import 'package:flutter/material.dart';

class ClusterWidget extends StatefulWidget {
  const ClusterWidget({
    super.key,
    required this.parent,
    required this.skillTree,
    required this.skillMap,
    required this.isClusterUnlocked,
    required this.maxClusterReduction,
    required this.callback,
  });

  final Enum parent;
  final Tree<Enum> skillTree;
  final Map<Enum, Skill> skillMap;
  final bool isClusterUnlocked;
  final int maxClusterReduction;
  final Function(Enum, int) callback;

  @override
  State<ClusterWidget> createState() => _ClusterWidgetState();
}

class _ClusterWidgetState extends State<ClusterWidget> {
  bool _isExpanded = false;

  Color? get _foregroundColor => widget.isClusterUnlocked
      ? Theme.of(context).primaryColor
      : Theme.of(context).disabledColor;

  @override
  Widget build(BuildContext context) => ExpansionTile(
        shape: Border(
          bottom: BorderSide(color: Theme.of(context).disabledColor),
        ),
        collapsedShape: Border(
          bottom: BorderSide(color: Theme.of(context).disabledColor),
        ),
        title: const Icon(null),
        onExpansionChanged: (value) {
          setState(() {
            _isExpanded = value;
          });
        },
        leading: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            AnimatedRotation(
              turns: _isExpanded ? -0.25 : 0,
              duration: const Duration(milliseconds: 200),
              child: Icon(
                Icons.expand_more,
                size: 24.0,
                color: _foregroundColor,
              ),
            ),
            TextButton(
              onPressed: null,
              child: Text(
                EnumUtils.enumToNameWithSpaces(
                  widget.skillTree.element,
                ),
                style: TextStyle(
                  color: _foregroundColor,
                  fontSize: 18.0,
                ),
              ),
            ),
          ],
        ),
        trailing: const Icon(null),
        children: widget.skillTree.children
            .map((child) => SkillWidget(
                  parent: widget.skillTree.element,
                  isClusterUnlocked: widget.isClusterUnlocked,
                  maxClusterReduction: widget.maxClusterReduction,
                  skillTree: child,
                  skillMap: widget.skillMap,
                  callback: (Enum e, int d) {
                    widget.callback(widget.skillTree.element, d);
                    widget.callback(e, d);
                  },
                ))
            .toList(growable: false),
      );
}
