import 'package:d4_utils/src/heroes/rogue.dart';
import 'package:d4_utils/src/data_structures/skill.dart';
import 'package:d4_utils/src/pages/home_page.dart';
import 'package:d4_utils/src/widgets/hero_widget.dart';
import 'package:flutter/material.dart';

class SkillCalculatorRoguePage extends StatelessWidget {
  const SkillCalculatorRoguePage({super.key});

  static const String title = 'Rogue';
  static const String route = '${HomePage.route}/skill_calculator_rogue';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(title),
      ),
      body: HeroWidget(
          skillTree: Rogue.rogue,
          skillMap: Rogue.rogue.fold({}, (b, a) {
            b.putIfAbsent(a, () => Skill(a));
            return b;
          })),
    );
  }
}
