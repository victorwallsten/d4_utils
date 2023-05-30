import 'package:d4_utils/src/pages/home_page.dart';
import 'package:d4_utils/src/pages/skill_calculator_barbarian_page.dart';
import 'package:d4_utils/src/pages/skill_calculator_druid_page.dart';
import 'package:d4_utils/src/pages/skill_calculator_necromancer_page.dart';
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
        colorScheme: const ColorScheme.light(),
      ).copyWith(
        primaryColor: Colors.grey[800],
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.grey[800],
        ),
        expansionTileTheme: const ExpansionTileThemeData(
          childrenPadding: EdgeInsets.only(left: 20),
        ),
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            alignment: Alignment.centerLeft,
          ),
        ),
      );

  Route _routeTo(Widget page) => PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => page,
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          const begin = Offset(1.0, 0.0);
          const end = Offset.zero;
          const curve = Curves.ease;

          var tween =
              Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

          return SlideTransition(
            position: animation.drive(tween),
            child: child,
          );
        },
      );

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
          case SkillCalculatorBarbarianPage.route:
            return _routeTo(const SkillCalculatorBarbarianPage());
          case SkillCalculatorDruidPage.route:
            return _routeTo(const SkillCalculatorDruidPage());
          case SkillCalculatorNecromancerPage.route:
            return _routeTo(const SkillCalculatorNecromancerPage());
          case SkillCalculatorRoguePage.route:
            return _routeTo(const SkillCalculatorRoguePage());
          case SkillCalculatorSorcererPage.route:
            return _routeTo(const SkillCalculatorSorcererPage());
          default:
            assert(false, 'case ${settings.name} missing');
            return null;
        }
      },
    );
  }
}
