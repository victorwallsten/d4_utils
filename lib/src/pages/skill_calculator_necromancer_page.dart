import 'package:d4_utils/src/heroes/necromancer.dart';
import 'package:d4_utils/src/data_structures/skill.dart';
import 'package:d4_utils/src/pages/home_page.dart';
import 'package:d4_utils/src/widgets/hero_widget.dart';
import 'package:flutter/material.dart';

class SkillCalculatorNecromancerPage extends StatelessWidget {
  const SkillCalculatorNecromancerPage({super.key});

  static const String title = 'Necromancer';
  static const String route = '${HomePage.route}/skill_calculator_necromancer';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(title),
      ),
      body: HeroWidget(
          skillTree: Necromancer.necromancer,
          skillMap: Necromancer.necromancer.fold({}, (b, a) {
            b.putIfAbsent(a, () => Skill(a));
            return b;
          })),
    );
  }
}
