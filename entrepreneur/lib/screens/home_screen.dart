import 'package:flutter/material.dart';
import 'package:entrepreneur/widgets/animated_logo.dart';
import 'package:entrepreneur/widgets/menu_button.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Theme.of(context).primaryColor,
              Theme.of(context).primaryColor.withOpacity(0.7),
            ],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              const SizedBox(height: 40),
              const AnimatedLogo(),
              const SizedBox(height: 20),
              Text(
                'EntrepreneurQuest',
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Votre aventure entrepreneuriale commence ici',
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  color: Colors.white.withOpacity(0.9),
                ),
                textAlign: TextAlign.center,
              ),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Column(
                  children: [
                    MenuButton(
                      title: 'Mode Aventure',
                      subtitle: 'Créez et développez votre entreprise',
                      icon: Icons.rocket_launch,
                      onTap: () => Navigator.pushNamed(context, '/adventure'),
                    ),
                    const SizedBox(height: 16),
                    MenuButton(
                      title: 'Mode Multijoueur',
                      subtitle: 'Affrontez d\'autres entrepreneurs',
                      icon: Icons.people,
                      onTap: () => Navigator.pushNamed(context, '/multiplayer'),
                    ),
                    const SizedBox(height: 16),
                    MenuButton(
                      title: 'Profil',
                      subtitle: 'Consultez vos statistiques et réalisations',
                      icon: Icons.person,
                      onTap: () => Navigator.pushNamed(context, '/profile'),
                    ),
                  ],
                ),
              ),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.only(bottom: 24.0),
                child: Text(
                  'v1.0.0 • Play to Learn',
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: Colors.white.withOpacity(0.7),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
