import 'package:d4_utils/src/pages/skill_calculator_barbarian_page.dart';
import 'package:d4_utils/src/pages/skill_calculator_druid_page.dart';
import 'package:d4_utils/src/pages/skill_calculator_necromancer_page.dart';
import 'package:d4_utils/src/pages/skill_calculator_rogue_page.dart';
import 'package:d4_utils/src/pages/skill_calculator_sorcerer_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  static const String title = 'Home';
  static const String route = '/';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(HomePage.title),
      ),
      body: ListView(children: [
        ExpansionTile(
            shape: Border(
                bottom: BorderSide(color: Theme.of(context).disabledColor)),
            collapsedShape: Border(
                bottom: BorderSide(color: Theme.of(context).disabledColor)),
            title: const Icon(null),
            onExpansionChanged: (value) {
              setState(() {
                _isExpanded = value;
              });
            },
            leading: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                AnimatedRotation(
                  turns: _isExpanded ? -0.25 : 0,
                  duration: const Duration(milliseconds: 200),
                  child: Icon(
                    Icons.expand_more,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
                TextButton(
                  onPressed: null,
                  child: Text(
                    'Skill Calculator',
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontSize: 18.0,
                    ),
                  ),
                ),
              ],
            ),
            trailing: const Icon(null),
            children: [
              (
                SkillCalculatorBarbarianPage.title,
                SkillCalculatorBarbarianPage.route,
              ),
              (
                SkillCalculatorDruidPage.title,
                SkillCalculatorDruidPage.route,
              ),
              (
                SkillCalculatorNecromancerPage.title,
                SkillCalculatorNecromancerPage.route,
              ),
              (
                SkillCalculatorRoguePage.title,
                SkillCalculatorRoguePage.route,
              ),
              (
                SkillCalculatorSorcererPage.title,
                SkillCalculatorSorcererPage.route,
              ),
            ]
                .map(
                  (e) => ListTile(
                    onTap: () => Navigator.pushNamed(context, e.$2),
                    leading: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(null),
                        TextButton(
                          onPressed: null,
                          child: Text(
                            e.$1,
                            style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontSize: 18.0,
                            ),
                          ),
                        ),
                      ],
                    ),
                    trailing: Icon(
                      Icons.arrow_forward_rounded,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                )
                .toList(
                  growable: false,
                ))
      ]),
    );
  }
}
