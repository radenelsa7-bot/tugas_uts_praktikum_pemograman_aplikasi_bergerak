import 'package:flutter/material.dart';

import 'pages/about_page.dart';
import 'pages/dashboard_page.dart';
import 'pages/counter_page.dart';
import 'pages/dynamic_list_page.dart';
import 'pages/grid_view_page.dart';
import 'pages/navigasi_sederhana_page.dart';
import 'pages/user_input_page.dart';
import 'pages/widget_bertingkat_page.dart';

void main() {
  runApp(const MyPortoApp());
}

class MyPortoApp extends StatelessWidget {
  const MyPortoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MyPorto',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
        useMaterial3: true,
        scaffoldBackgroundColor: Colors.grey[100],
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          foregroundColor: Colors.black87,
          elevation: 1,
          centerTitle: false,
          surfaceTintColor: Colors.white,
        ),
        cardTheme: CardThemeData(
          elevation: 3,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          margin: EdgeInsets.zero,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.teal,
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            elevation: 0,
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
          ),
        ),
      ),
      initialRoute: DashboardPage.routeName,
      routes: {
        DashboardPage.routeName: (_) => const DashboardPage(),
        CounterPage.routeName: (_) => const CounterPage(),
        WidgetBertingkatPage.routeName: (_) => const WidgetBertingkatPage(),
        UserInputPage.routeName: (_) => const UserInputPage(),
        DynamicListPage.routeName: (_) => const DynamicListPage(),
        NavigasiSederhanaPage.routeName: (_) => const NavigasiSederhanaPage(),
        GridViewPage.routeName: (_) => const GridViewPage(),
        AboutPage.routeName: (_) => const AboutPage(),
      },
    );
  }
}
