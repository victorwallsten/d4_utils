import 'package:d4_utils/src/pages/home_page.dart';
import 'package:d4_utils/src/pages/skill_calculator_barbarian_page.dart';
import 'package:flutter/material.dart';

class SkillCalculatorPage extends StatelessWidget {
  const SkillCalculatorPage({super.key});

  static const String title = 'Skill Calculator';
  static const String route = '${HomePage.route}skill_calculator';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(title),
      ),
      body: ListView(
        children: [
          ListTile(
            leading: const Icon(Icons.bar_chart_rounded),
            title: const Text(SkillCalculatorBarbarianPage.title),
            trailing: IconButton(
              icon: const Icon(Icons.arrow_forward),
              onPressed: () => Navigator.pushNamed(
                  context, SkillCalculatorBarbarianPage.route),
            ),
          ),
        ],
      ),
    );
  }
}
