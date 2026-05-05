import 'package:flutter/material.dart';

import '../widgets/menu_button.dart';
import 'about_page.dart';
import 'counter_page.dart';
import 'dynamic_list_page.dart';
import 'grid_view_page.dart';
import 'navigasi_sederhana_page.dart';
import 'user_input_page.dart';
import 'widget_bertingkat_page.dart';

class DashboardPage extends StatefulWidget {
  static const routeName = '/';

  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  int selectedIndex = -1;
  bool pastelMode = false;

  final items = const [
    _DashboardMenuItem(
      'Counter',
      Icons.add,
      CounterPage.routeName,
      Color(0xFF8CC6FF),
    ),
    _DashboardMenuItem(
      'Widget Bertingkat',
      Icons.widgets,
      WidgetBertingkatPage.routeName,
      Color(0xFF99E1C7),
    ),
    _DashboardMenuItem(
      'User Input',
      Icons.person_outline,
      UserInputPage.routeName,
      Color(0xFFFFD29F),
    ),
    _DashboardMenuItem(
      'Dynamic List',
      Icons.list_alt,
      DynamicListPage.routeName,
      Color(0xFFD8B2FF),
    ),
    _DashboardMenuItem(
      'Navigasi',
      Icons.navigation,
      NavigasiSederhanaPage.routeName,
      Color(0xFF94D6FF),
    ),
    _DashboardMenuItem(
      'Grid View',
      Icons.grid_view,
      GridViewPage.routeName,
      Color(0xFFB8E986),
    ),
    _DashboardMenuItem(
      'Tentang Saya',
      Icons.info_outline,
      AboutPage.routeName,
      Color(0xFFFFA7C4),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('MyPorto'), elevation: 1),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _DashboardHeader(),
            const SizedBox(height: 24),
            Expanded(
              child: ListView.separated(
                padding: EdgeInsets.zero,
                itemCount: items.length,
                separatorBuilder: (context, index) =>
                    const SizedBox(height: 16),
                itemBuilder: (context, index) {
                  final item = items[index];
                  return MenuButton(
                    title: item.title,
                    icon: item.icon,
                    color: item.color,
                    selected: selectedIndex == index,
                    allPastel: pastelMode,
                    onPressed: () {
                      final route = item.route;
                      final navigator = Navigator.of(context);
                      setState(() {
                        selectedIndex = index;
                        pastelMode = true;
                      });
                      Future.delayed(const Duration(milliseconds: 120), () {
                        navigator.pushNamed(route);
                      });
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _DashboardHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF8CC6FF), Color(0xFFFFD29F)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(24),
        boxShadow: const [
          BoxShadow(
            color: Color.fromRGBO(0, 0, 0, 0.08),
            blurRadius: 18,
            offset: Offset(0, 8),
          ),
        ],
      ),
      padding: const EdgeInsets.all(24),
      child: Row(
        children: [
          Container(
            width: 64,
            height: 64,
            decoration: BoxDecoration(
              color: Colors.white24,
              borderRadius: BorderRadius.circular(18),
            ),
            child: const Icon(
              Icons.auto_stories_outlined,
              color: Colors.white,
              size: 32,
            ),
          ),
          const SizedBox(width: 18),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'MyPorto',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 26,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  'Cek hasil karyaku disini',
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 15,
                    height: 1.4,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _DashboardMenuItem {
  final String title;
  final IconData icon;
  final String route;
  final Color color;

  const _DashboardMenuItem(this.title, this.icon, this.route, this.color);
}
