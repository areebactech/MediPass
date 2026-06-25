import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

// IMPORT ALL SCREENS
import 'screens/splash.dart';
import 'screens/login.dart';
import 'screens/signup.dart';
import 'screens/home_screen.dart';
import 'screens/profile.dart';
import 'screens/qr.dart';
import 'screens/records.dart';
import 'screens/record_details.dart';
import 'screens/family.dart';
import 'screens/add_family.dart';
import 'screens/settings.dart';
import 'screens/help.dart';
import 'screens/about.dart';
import 'screens/notifications.dart';
import 'screens/skin_analysis.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  // Firebase Initialize with your Web Config
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: "AIzaSyBVeM8WVxdaxWmvSa4EVOrMx0uZf7XPVBI",
      authDomain: "medi-pass.firebaseapp.com",
      projectId: "medi-pass",
      storageBucket: "medi-pass.firebasestorage.app",
      messagingSenderId: "882227100521",
      appId: "1:882227100521:web:b7ad7dada9d832661e1bf8",
      measurementId: "G-R2BRGWY0XL",
    ),
  );
  
  runApp(const MediPassApp());
}

class MediPassApp extends StatelessWidget {
  const MediPassApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MediPass',
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: const Color(0xFFF4F7FB),
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF1D4ED8),
          primary: const Color(0xFF1D4ED8),
          secondary: const Color(0xFF0F766E),
          surface: Colors.white,
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: false,
          foregroundColor: Color(0xFF0F172A),
        ),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: Colors.white,
          contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(18), borderSide: const BorderSide(color: Color(0xFFE2E8F0))),
          enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(18), borderSide: const BorderSide(color: Color(0xFFE2E8F0))),
          focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(18), borderSide: const BorderSide(color: Color(0xFF1D4ED8), width: 1.4)),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF1D4ED8),
            foregroundColor: Colors.white,
            minimumSize: const Size.fromHeight(54),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
            textStyle: const TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
          ),
        ),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashScreen(),
        '/login': (context) => const LoginScreen(),
        '/signup': (context) => const SignupScreen(),
        '/home': (context) => const HomeScreen(),
        '/profile': (context) => const ProfileScreen(),
        '/qr': (context) => const QRScreen(),
        '/records': (context) => const RecordsScreen(),
        '/recordDetails': (context) => const RecordDetailScreen(),
        '/family': (context) => FamilyScreen(),
        '/addFamily': (context) => const AddFamilyScreen(),
        '/settings': (context) => const SettingsScreen(),
        '/help': (context) => const HelpScreen(),
        '/about': (context) => const AboutScreen(),
        '/notifications': (context) => const NotificationsScreen(),
        '/skin_analysis': (context) => const SkinAnalysisScreen(),
      },
    );
  }
}