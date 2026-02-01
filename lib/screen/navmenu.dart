import 'package:flutter/material.dart';
import 'package:mobilekakkak/screen/dashboard.dart';
import 'package:mobilekakkak/screen/signup_screen.dart'; // สมมติว่ามีไฟล์นี้
import 'package:mobilekakkak/screen/login_screen.dart'; // สมมติว่ามีไฟล์นี้
import 'package:mobilekakkak/theme/punk_theme.dart'; // Import Punk Theme
import 'package:shared_preferences/shared_preferences.dart';

class NavigationMenu extends StatefulWidget {
  const NavigationMenu({super.key});

  @override
  State<NavigationMenu> createState() => _NavigationMenuState();
}

class _NavigationMenuState extends State<NavigationMenu> {
  int selectedIndex = 0;
  bool isLoggedIn = false;
  bool _isLoading = true;
  Device? _selectedDevice;
  String _profileScreen = 'signup';

  @override
  void initState() {
    super.initState();
    _checkLoginStatus();
  }

  Future<void> _checkLoginStatus() async {
    final prefs = await SharedPreferences.getInstance();
    final loggedIn = prefs.getBool('isLoggedIn') ?? false;
    setState(() {
      isLoggedIn = loggedIn;
      _profileScreen = loggedIn ? 'login' : 'signup';
      _isLoading = false;
    });
  }

  void _onDeviceTap(Device device) {
    setState(() {
      _selectedDevice = device;
    });
  }

  void _onDetailClose() {
    setState(() {
      _selectedDevice = null;
    });
  }

  void _goToLogin() {
    setState(() {
      _profileScreen = 'login';
    });
  }

  void _goToSignup() {
    setState(() {
      _profileScreen = 'signup';
    });
  }

  @override
  Widget build(BuildContext context) {
    // 1. Loading State (ปรับสีเป็น Punk)
    if (_isLoading) {
      return const Scaffold(
        backgroundColor: PunkColors.background,
        body: Center(
          child: CircularProgressIndicator(color: PunkColors.primary),
        ),
      );
    }

    Widget profileWidget;
    if (_profileScreen == 'login') {
      profileWidget = LoginScreen(onGoToSignup: _goToSignup);
    } else {
      profileWidget = SignupScreen(onGoToLogin: _goToLogin);
    }

    Widget body;
    if (_selectedDevice != null && selectedIndex == 0) {
      body = DeviceDetailPage(
        device: _selectedDevice!,
        onClose: _onDetailClose,
      );
    } else {
      body = IndexedStack(
        index: selectedIndex,
        children: [
          DashboardPage(onDeviceTap: _onDeviceTap),
          const SearchPage(),
          const AutomationPage(),
          profileWidget, // หมายเหตุ: ไฟล์ Login/Signup ต้องถูกแก้ให้ใช้ PunkTheme ด้วยเช่นกัน
        ],
      );
    }

    return Scaffold(
      // 2. ใช้สีพื้นหลังดำ
      backgroundColor: PunkColors.background,
      body: body,

      // 3. ปรับแต่ง NavigationBar ให้เข้ากับธีม Punk
      bottomNavigationBar: NavigationBarTheme(
        data: NavigationBarThemeData(
          backgroundColor: PunkColors.surface,
          indicatorColor: PunkColors.primary.withOpacity(0.2),
          labelTextStyle: MaterialStateProperty.resolveWith((states) {
            if (states.contains(MaterialState.selected)) {
              return PunkTextStyles.label.copyWith(color: PunkColors.primary);
            }
            return PunkTextStyles.label.copyWith(
              color: PunkColors.onBackground.withOpacity(0.5),
            );
          }),
          iconTheme: MaterialStateProperty.resolveWith((states) {
            if (states.contains(MaterialState.selected)) {
              return const IconThemeData(color: PunkColors.primary);
            }
            return IconThemeData(
              color: PunkColors.onBackground.withOpacity(0.5),
            );
          }),
        ),
        child: NavigationBar(
          selectedIndex: selectedIndex,
          onDestinationSelected: (int index) {
            if (index == 3) {
              _checkLoginStatus();
            }
            setState(() {
              selectedIndex = index;
              _selectedDevice = null;
            });
          },
          destinations: const [
            NavigationDestination(
              icon: Icon(Icons.home_outlined),
              label: 'HOME',
            ),
            NavigationDestination(
              icon: Icon(Icons.search_outlined),
              label: 'SEARCH',
            ),
            NavigationDestination(
              icon: Icon(Icons.auto_awesome_outlined),
              label: 'AUTO',
            ),
            NavigationDestination(
              icon: Icon(Icons.person_outlined),
              label: 'PROFILE',
            ),
          ],
        ),
      ),
    );
  }
}
