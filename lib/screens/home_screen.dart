import 'package:flutter/material.dart';
import 'records.dart';
import 'family.dart';
import 'profile.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  final List<Widget> _pages = [
    const DashboardView(),
    const RecordsScreen(),
    FamilyScreen(),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F7FB),
      body: _pages[_selectedIndex],
      bottomNavigationBar: NavigationBar(
        backgroundColor: Colors.white,
        elevation: 0,
        selectedIndex: _selectedIndex,
        indicatorColor: const Color(0xFF1D4ED8).withValues(alpha: 0.10),
        onDestinationSelected: (i) => setState(() => _selectedIndex = i),
        destinations: const [
          NavigationDestination(icon: Icon(Icons.home_outlined), selectedIcon: Icon(Icons.home_filled, color: Color(0xFF1D4ED8)), label: 'Home'),
          NavigationDestination(icon: Icon(Icons.folder_copy_outlined), selectedIcon: Icon(Icons.folder_copy_rounded, color: Color(0xFF1D4ED8)), label: 'Records'),
          NavigationDestination(icon: Icon(Icons.family_restroom_outlined), selectedIcon: Icon(Icons.family_restroom_rounded, color: Color(0xFF1D4ED8)), label: 'Family'),
          NavigationDestination(icon: Icon(Icons.person_outline), selectedIcon: Icon(Icons.person_rounded, color: Color(0xFF1D4ED8)), label: 'Profile'),
        ],
      ),
    );
  }
}

// ── Dashboard ────────────────────────────────────────────────────────────────
class DashboardView extends StatelessWidget {
  const DashboardView({super.key});

  static const _blue = Color(0xFF1D4ED8);
  static const _dark = Color(0xFF0F172A);
  static const _grey = Color(0xFF64748B);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView(
        padding: const EdgeInsets.fromLTRB(20, 16, 20, 28),
        children: [
          _header(context),
          const SizedBox(height: 18),
          _heroCard(context),
          const SizedBox(height: 22),
          _sectionHeader('Recent Updates', 'Latest activity at a glance'),
          const SizedBox(height: 12),
          _infoRow(Icons.event_available_outlined, 'Check-up reminder', 'Annual review scheduled for this week', 'Today'),
          const SizedBox(height: 10),
          _infoRow(Icons.shield_outlined, 'Record sync complete', 'Your profile data is up to date', 'Secure'),
          const SizedBox(height: 22),
          _sectionHeader('More', 'Jump to other areas of the app'),
          const SizedBox(height: 12),
          _actionTile(context, Icons.settings_outlined, 'Settings', 'Privacy, appearance, and logout', const [Color(0xFF334155), Color(0xFF64748B)], '/settings'),
          const SizedBox(height: 12),
          _actionTile(context, Icons.help_outline, 'Help & Support', 'FAQs and contact support', const [Color(0xFFF97316), Color(0xFFFBBF24)], '/help'),
          const SizedBox(height: 12),
          _actionTile(context, Icons.info_outline, 'About', 'Learn about MediPass', const [_blue, Color(0xFF93C5FD)], '/about'),
        ],
      ),
    );
  }

  Widget _header(BuildContext context) {
    final primary = Theme.of(context).colorScheme.primary;
    return Row(
      children: [
        Container(
          width: 54, height: 54,
          decoration: BoxDecoration(
            gradient: const LinearGradient(colors: [Color(0xFF1D4ED8), Color(0xFF38BDF8)], begin: Alignment.topLeft, end: Alignment.bottomRight),
            borderRadius: BorderRadius.circular(18),
          ),
          child: const Icon(Icons.health_and_safety_rounded, color: Colors.white, size: 28),
        ),
        const SizedBox(width: 14),
        const Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Good morning', style: TextStyle(fontSize: 22, fontWeight: FontWeight.w800, color: _dark)),
              SizedBox(height: 4),
              Text('Your health overview is ready', style: TextStyle(fontSize: 14, color: _grey)),
            ],
          ),
        ),
        IconButton(
          onPressed: () => Navigator.pushNamed(context, '/notifications'),
          icon: Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(color: primary.withValues(alpha: 0.08), shape: BoxShape.circle),
            child: Icon(Icons.notifications_none_rounded, color: primary),
          ),
        ),
      ],
    );
  }

  Widget _heroCard(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: const LinearGradient(colors: [Color(0xFF0F172A), Color(0xFF1D4ED8)], begin: Alignment.topLeft, end: Alignment.bottomRight),
        borderRadius: BorderRadius.circular(28),
        boxShadow: const [BoxShadow(color: Color(0x1A0F172A), blurRadius: 24, offset: Offset(0, 14))],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            decoration: BoxDecoration(color: Colors.white.withValues(alpha: 0.12), borderRadius: BorderRadius.circular(999)),
            child: const Text('Health snapshot', style: TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.w700)),
          ),
          const SizedBox(height: 16),
          const Text(
            'Stay on top of your care with organized records and quick access tools.',
            style: TextStyle(color: Colors.white, fontSize: 22, height: 1.25, fontWeight: FontWeight.w800),
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(child: _heroBtn(context, Icons.camera_alt_outlined, 'AI Scanner', 'Skin analysis', const [Color(0xFF2563EB), Color(0xFF60A5FA)], '/skin_analysis')),
              const SizedBox(width: 12),
              Expanded(child: _heroBtn(context, Icons.qr_code_2_rounded, 'My QR ID', 'Emergency access', const [Color(0xFF6D28D9), Color(0xFFA78BFA)], '/qr')),
            ],
          ),
        ],
      ),
    );
  }

  Widget _heroBtn(BuildContext context, IconData icon, String label, String sub, List<Color> grad, String route) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, route),
      child: Container(
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: grad, begin: Alignment.topLeft, end: Alignment.bottomRight),
          borderRadius: BorderRadius.circular(20),
          boxShadow: [BoxShadow(color: grad.last.withValues(alpha: 0.35), blurRadius: 12, offset: const Offset(0, 6))],
        ),
        child: Row(
          children: [
            Container(
              width: 36, height: 36,
              decoration: BoxDecoration(color: Colors.white.withValues(alpha: 0.20), borderRadius: BorderRadius.circular(12)),
              child: Icon(icon, color: Colors.white, size: 20),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(label, style: const TextStyle(color: Colors.white, fontSize: 13, fontWeight: FontWeight.w800)),
                  const SizedBox(height: 2),
                  Text(sub, style: TextStyle(color: Colors.white.withValues(alpha: 0.80), fontSize: 11), overflow: TextOverflow.ellipsis),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _sectionHeader(String title, String sub) => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w800, color: _dark)),
      const SizedBox(height: 4),
      Text(sub, style: const TextStyle(fontSize: 13, color: _grey)),
    ],
  );

  Widget _actionTile(BuildContext context, IconData icon, String title, String sub, List<Color> grad, String route) {
    return Material(
      color: Colors.white,
      borderRadius: BorderRadius.circular(22),
      child: InkWell(
        borderRadius: BorderRadius.circular(22),
        onTap: () => Navigator.pushNamed(context, route),
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(22), border: Border.all(color: const Color(0xFFE2E8F0))),
          child: Row(
            children: [
              Container(
                width: 54, height: 54,
                decoration: BoxDecoration(gradient: LinearGradient(colors: grad), borderRadius: BorderRadius.circular(18)),
                child: Icon(icon, color: Colors.white, size: 28),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w800, color: _dark)),
                    const SizedBox(height: 5),
                    Text(sub, style: const TextStyle(fontSize: 13, color: _grey)),
                  ],
                ),
              ),
              const Icon(Icons.chevron_right_rounded, color: Color(0xFF94A3B8), size: 28),
            ],
          ),
        ),
      ),
    );
  }

  Widget _infoRow(IconData icon, String title, String sub, String trailing) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(20), border: Border.all(color: const Color(0xFFE2E8F0))),
      child: Row(
        children: [
          Container(
            width: 44, height: 44,
            decoration: BoxDecoration(color: const Color(0xFFF1F5F9), borderRadius: BorderRadius.circular(14)),
            child: Icon(icon, color: _blue),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w800, color: _dark)),
                const SizedBox(height: 4),
                Text(sub, style: const TextStyle(fontSize: 13, color: _grey)),
              ],
            ),
          ),
          const SizedBox(width: 10),
          Text(trailing, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w800, color: _blue)),
        ],
      ),
    );
  }
}
