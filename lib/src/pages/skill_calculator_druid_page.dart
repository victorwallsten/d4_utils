import 'package:d4_utils/src/character_classes/druid.dart';
import 'package:d4_utils/src/pages/skill_calculator_page.dart';
import 'package:d4_utils/src/widgets/character_class_widget.dart';
import 'package:flutter/material.dart';

class SkillCalculatorDruidPage extends StatelessWidget {
  const SkillCalculatorDruidPage({super.key});

  static const String title = 'Druid';
  static const String route = '${SkillCalculatorPage.route}/druid';

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

