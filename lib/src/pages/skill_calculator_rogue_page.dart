import 'package:d4_utils/src/character_classes/rogue.dart';
import 'package:d4_utils/src/pages/skill_calculator_page.dart';
import 'package:d4_utils/src/widgets/character_class_widget.dart';
import 'package:flutter/material.dart';

class SkillCalculatorRoguePage extends StatelessWidget {
  const SkillCalculatorRoguePage({super.key});

  static const String title = 'Rogue';
  static const String route = '${SkillCalculatorPage.route}/rogue';

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

