import 'package:d4_utils/src/heroes/sorcerer.dart';
import 'package:d4_utils/src/data_structures/skill.dart';
import 'package:d4_utils/src/pages/home_page.dart';
import 'package:d4_utils/src/widgets/hero_widget.dart';
import 'package:flutter/material.dart';

class SkillCalculatorSorcererPage extends StatelessWidget {
  const SkillCalculatorSorcererPage({super.key});

  static const String title = 'Sorcerer';
  static const String route = '${HomePage.route}/skill_calculator_sorcerer';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(title),
      ),
      body: HeroWidget(
          skillTree: Sorcerer.sorcerer,
          skillMap: Sorcerer.sorcerer.fold({}, (b, a) {
            b.putIfAbsent(a, () => Skill(a));
            return b;
          })),
    );
  }
}
