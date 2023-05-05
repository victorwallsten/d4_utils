import 'package:d4_utils/src/heroes/barbarian.dart';
import 'package:d4_utils/src/data_structures/skill.dart';
import 'package:d4_utils/src/pages/skill_calculator_page.dart';
import 'package:d4_utils/src/widgets/hero_widget.dart';
import 'package:flutter/material.dart';

class SkillCalculatorBarbarianPage extends StatelessWidget {
  const SkillCalculatorBarbarianPage({super.key});

  static const String title = 'Barbarian';
  static const String route = '${SkillCalculatorPage.route}/barbarian';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(title),
      ),
      body: HeroWidget(
          skillTree: Barbarian.barbarian,
          skillMap: Barbarian.barbarian.fold({}, (b, a) {
            b.putIfAbsent(a, () => Skill(a));
            return b;
          })),
    );
  }
}
