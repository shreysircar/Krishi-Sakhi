import 'package:flutter/material.dart';
import 'screens/a.dart';
import 'screens/b.dart';
import 'screens/c.dart';
import 'screens/d.dart';
import 'screens/e.dart';
import 'nav_item.dart'; // import the class

class BottomNav extends StatefulWidget {
  const BottomNav({super.key});

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int _currentIndex = 0;

  final List<NavItem> _navItems = [
    NavItem(screen: DashboardScreen(), icon: Icons.dashboard_customize),
    NavItem(screen: NewsScreen(), icon: Icons.newspaper),
    const NavItem(screen: ReportIssueScreen(), icon: Icons.add_alert),
    const NavItem(screen: MarketScreen(), icon: Icons.currency_rupee_sharp),
    const NavItem(screen: ProfileScreen(), icon: Icons.person),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _navItems[_currentIndex].screen,
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(24),
            topRight: Radius.circular(24),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 10,
              spreadRadius: 2,
              offset: const Offset(0, -2),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(24),
            topRight: Radius.circular(24),
          ),
          child: BottomNavigationBar(
            backgroundColor: Colors.white,
            currentIndex: _currentIndex,
            type: BottomNavigationBarType.fixed,
            selectedItemColor: const Color(0xFFaf4c0f), // ✅ brown color
            unselectedItemColor: Colors.grey[600],
            showSelectedLabels: false, // 🔥 hides labels
            showUnselectedLabels: false, // 🔥 hides labels
            items: _navItems
                .map(
                  (item) => BottomNavigationBarItem(
                icon: Icon(item.icon),
                label: '', // 👈 must provide, even if empty
              ),
            )
                .toList(),
            onTap: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
          ),
        ),
      ),
    );
  }
}
