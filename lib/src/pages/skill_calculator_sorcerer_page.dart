import 'package:d4_utils/src/character_classes/sorcerer.dart';
import 'package:d4_utils/src/pages/skill_calculator_page.dart';
import 'package:d4_utils/src/widgets/character_class_widget.dart';
import 'package:flutter/material.dart';

class SkillCalculatorSorcererPage extends StatelessWidget {
  const SkillCalculatorSorcererPage({super.key});

  static const String title = 'Sorcerer';
  static const String route = '${SkillCalculatorPage.route}/sorcerer';

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

