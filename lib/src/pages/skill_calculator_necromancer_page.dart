import 'package:d4_utils/src/character_classes/necromancer.dart';
import 'package:d4_utils/src/pages/skill_calculator_page.dart';
import 'package:d4_utils/src/widgets/character_class_widget.dart';
import 'package:flutter/material.dart';

class SkillCalculatorNecromancerPage extends StatelessWidget {
  const SkillCalculatorNecromancerPage({super.key});

  static const String title = 'Necromancer';
  static const String route = '${SkillCalculatorPage.route}/necromancer';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(title),
      ),
      body: const Placeholder(),
    );
  }
}

