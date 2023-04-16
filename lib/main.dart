import 'dart:math';

import 'package:d4_utils/src/pages/home_page.dart';
import 'package:d4_utils/src/pages/skill_calculator_barbarian_page.dart';
import 'package:d4_utils/src/pages/skill_calculator_druid_page.dart';
import 'package:d4_utils/src/pages/skill_calculator_necromancer_page.dart';
import 'package:d4_utils/src/pages/skill_calculator_page.dart';
import 'package:d4_utils/src/pages/skill_calculator_rogue_page.dart';
import 'package:d4_utils/src/pages/skill_calculator_sorcerer_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const D4Utils());
}

class D4Utils extends StatelessWidget {
  const D4Utils({super.key});

  static const String title = 'D4 Utils';

  ThemeData get _themeData => ThemeData.from(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Color(
            Random().nextInt(0xFFFFFFFF),
          ),
        ),
      ).copyWith(
          expansionTileTheme: const ExpansionTileThemeData(
        shape: Border(),
        childrenPadding: EdgeInsets.only(left: 20),
      ));

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: title,
      theme: _themeData,
      initialRoute: HomePage.route,
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case HomePage.route:
            return MaterialPageRoute(
              builder: (context) => const HomePage(),
            );
          case SkillCalculatorPage.route:
            return MaterialPageRoute(
              builder: (context) => const SkillCalculatorPage(),
            );
          case SkillCalculatorBarbarianPage.route:
            return MaterialPageRoute(
              builder: (context) => const SkillCalculatorBarbarianPage(),
            );
          case SkillCalculatorDruidPage.route:
            return MaterialPageRoute(
              builder: (context) => const SkillCalculatorDruidPage(),
            );
          case SkillCalculatorNecromancerPage.route:
            return MaterialPageRoute(
              builder: (context) => const SkillCalculatorNecromancerPage(),
            );
          case SkillCalculatorRoguePage.route:
            return MaterialPageRoute(
              builder: (context) => const SkillCalculatorRoguePage(),
            );
          case SkillCalculatorSorcererPage.route:
            return MaterialPageRoute(
              builder: (context) => const SkillCalculatorSorcererPage(),
            );
          default:
            assert(false, 'case ${settings.name} missing');
            return null;
        }
      },
    );
  }
}
