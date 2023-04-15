import 'package:d4_utils/src/pages/home_page.dart';
import 'package:d4_utils/src/pages/skill_calculator_barbarian_page.dart';
import 'package:d4_utils/src/pages/skill_calculator_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const D4Utils());
}

class D4Utils extends StatelessWidget {
  const D4Utils({super.key});

  static const String title = 'D4 Utils';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: title,
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
          default:
            assert(false, 'case ${settings.name} missing');
            return null;
        }
      },
    );
  }
}
