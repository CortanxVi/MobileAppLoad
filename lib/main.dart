import 'package:flutter/material.dart';
import 'package:mobilekakkak/screen/dashboard.dart';
import 'package:mobilekakkak/screen/navmenu.dart';
import 'package:mobilekakkak/screen/onboarding.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

bool? seen;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final prefs = await SharedPreferences.getInstance();
  seen = prefs.getBool('seen') ?? false;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Smart Home Dashboard',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: const Color(0xFFF2F2F7),
      ),
      // ถ้าเคยเห็น onboarding แล้วให้ไปหน้า NavigationMenu เลย
      home: seen == true ? const NavigationMenu() : const OnboardingScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
