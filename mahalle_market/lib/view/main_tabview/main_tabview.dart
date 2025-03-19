import 'package:flutter/material.dart';
import 'package:mahalle_market/common/color_extensions.dart';
import 'package:mahalle_market/view/home/home_view.dart';
import 'dart:math' as math;

class MainTabView extends StatefulWidget {
  const MainTabView({super.key});

  @override
  State<MainTabView> createState() => _MainTabViewState();
}

class _MainTabViewState extends State<MainTabView> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    const HomeView(),
    const Center(
        child: Text('Siparişlerim',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold))),
    const Center(
        child: Text('Profil',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold))),
  ];

  void _onItemTapped(int index) {
    if (index >= 0 && index < _pages.length) {
      setState(() {
        _selectedIndex = index;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: _pages[_selectedIndex],
      ),
      floatingActionButton: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [TColor.primary.withOpacity(0.7), TColor.primary],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: TColor.primary.withOpacity(0.3),
              blurRadius: 10,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: FloatingActionButton(
          backgroundColor: Colors.transparent,
          elevation: 0,
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const EmptyPage(),
              ),
            );
          },
          child: const Icon(
            Icons.map,
            color: Colors.white,
            size: 28,
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotch(
          notchRadius: 35,
          notchMargin: 8,
        ),
        color: Colors.white,
        elevation: 8,
        notchMargin: 8,
        child: SizedBox(
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              // First Half
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildNavItem(
                        0, Icons.home_outlined, Icons.home, 'Ana Sayfa'),
                    _buildNavItem(1, Icons.receipt_long_outlined,
                        Icons.receipt_long, 'Siparişler'),
                  ],
                ),
              ),

              // Spacer
              const SizedBox(width: 80),

              // Second Half
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildNavItem(
                        2, Icons.person_outline, Icons.person, 'Profil'),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Navigation Item Widget
  Widget _buildNavItem(
      int index, IconData iconOutlined, IconData iconFilled, String label) {
    final bool isSelected = _selectedIndex == index;
    return InkWell(
      onTap: () => _onItemTapped(index),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 4),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              isSelected ? iconFilled : iconOutlined,
              color: isSelected ? TColor.primary : TColor.placeholder,
              size: 24,
            ),
            const SizedBox(height: 4),
            Text(
              label,
              style: TextStyle(
                color: isSelected ? TColor.primary : TColor.placeholder,
                fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
                fontSize: 10,
              ),
              textAlign: TextAlign.center,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}

// Harita sayfası
class EmptyPage extends StatelessWidget {
  const EmptyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Harita'),
        backgroundColor: TColor.primary,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.map_outlined,
              size: 100,
              color: TColor.primary.withOpacity(0.5),
            ),
            const SizedBox(height: 20),
            Text(
              'Harita Yakında',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: TColor.SecondaryText,
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Text(
                'Bu özellik şu anda geliştirme aşamasındadır. Çok yakında kullanıma sunulacaktır.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  color: TColor.placeholder,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// CircularNotch class definition
class CircularNotch extends NotchedShape {
  const CircularNotch({required this.notchRadius, required this.notchMargin});

  final double notchRadius;
  final double notchMargin;

  @override
  Path getOuterPath(Rect host, Rect? guest, {TextDirection? textDirection}) {
    if (guest == null || !host.overlaps(guest)) {
      return Path()..addRect(host);
    }

    final double notchRadius = this.notchRadius;
    const double s1 = 15.0;
    const double s2 = 1.0;

    final double r = notchRadius;
    final double a = -1.0 * r - s2;
    final double b = host.top - guest.center.dy;

    final double n2 =
        math.sqrt(b * b * r * r * (1.0 - b * b / (b * b + a * a)));
    final double p2xA = guest.center.dx + a - n2 / (b * b + a * a);
    final double p2xB = guest.center.dx + a + n2 / (b * b + a * a);
    final double p2yA = host.top - b * (p2xA - guest.center.dx) / a;
    final double p2yB = host.top - b * (p2xB - guest.center.dx) / a;

    final Path path = Path()
      ..moveTo(host.left, host.top)
      ..lineTo(p2xA - notchMargin, host.top)
      ..arcToPoint(
        Offset(p2xA + notchMargin, host.top),
        radius: Radius.circular(notchMargin),
        clockwise: false,
      )
      ..arcToPoint(
        Offset(p2xB - notchMargin, host.top),
        radius: Radius.circular(notchRadius),
        clockwise: false,
      )
      ..arcToPoint(
        Offset(p2xB + notchMargin, host.top),
        radius: Radius.circular(notchMargin),
        clockwise: false,
      )
      ..lineTo(host.right, host.top)
      ..lineTo(host.right, host.bottom)
      ..lineTo(host.left, host.bottom)
      ..close();
    return path;
  }
}
