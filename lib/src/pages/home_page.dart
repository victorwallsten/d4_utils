import 'package:d4_utils/src/pages/skill_calculator_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static const String title = 'Home';
  static const String route = '/';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(title),
      ),
      body: ListView(
        children: [
          ListTile(
            leading: const Icon(Icons.calculate_rounded),
            title: const Text(SkillCalculatorPage.title),
            trailing: IconButton(
              icon: const Icon(Icons.arrow_forward),
              onPressed: () =>
                  Navigator.pushNamed(context, SkillCalculatorPage.route),
            ),
          ),
        ],
      ),
    );
  }
}
