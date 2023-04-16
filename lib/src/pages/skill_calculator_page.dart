import 'package:d4_utils/src/pages/home_page.dart';
import 'package:d4_utils/src/pages/skill_calculator_barbarian_page.dart';
import 'package:d4_utils/src/pages/skill_calculator_druid_page.dart';
import 'package:d4_utils/src/pages/skill_calculator_necromancer_page.dart';
import 'package:d4_utils/src/pages/skill_calculator_rogue_page.dart';
import 'package:d4_utils/src/pages/skill_calculator_sorcerer_page.dart';
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
          ListTile(
            leading: const Icon(Icons.deck_rounded),
            title: const Text(SkillCalculatorDruidPage.title),
            trailing: IconButton(
              icon: const Icon(Icons.arrow_forward),
              onPressed: () =>
                  Navigator.pushNamed(context, SkillCalculatorDruidPage.route),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.newspaper_rounded),
            title: const Text(SkillCalculatorNecromancerPage.title),
            trailing: IconButton(
              icon: const Icon(Icons.arrow_forward),
              onPressed: () => Navigator.pushNamed(
                  context, SkillCalculatorNecromancerPage.route),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.route_rounded),
            title: const Text(SkillCalculatorRoguePage.title),
            trailing: IconButton(
              icon: const Icon(Icons.arrow_forward),
              onPressed: () =>
                  Navigator.pushNamed(context, SkillCalculatorRoguePage.route),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.source_rounded),
            title: const Text(SkillCalculatorSorcererPage.title),
            trailing: IconButton(
              icon: const Icon(Icons.arrow_forward),
              onPressed: () => Navigator.pushNamed(
                  context, SkillCalculatorSorcererPage.route),
            ),
          ),
        ],
      ),
    );
  }
}
