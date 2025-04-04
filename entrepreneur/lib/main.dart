import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:entrepreneur/screens/home_screen.dart';
import 'package:entrepreneur/screens/adventure_mode_screen.dart';
import 'package:entrepreneur/screens/multiplayer_screen.dart';
import 'package:entrepreneur/screens/profile_screen.dart';
import 'package:entrepreneur/theme/app_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const EntrepreneurQuestApp());
}

class EntrepreneurQuestApp extends StatelessWidget {
  const EntrepreneurQuestApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'EntrepreneurQuest',
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.system,
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const HomeScreen(),
        '/adventure': (context) => const AdventureModeScreen(),
        '/multiplayer': (context) => const MultiplayerScreen(),
        '/profile': (context) => const ProfileScreen(),
      },
    );
  }
}
