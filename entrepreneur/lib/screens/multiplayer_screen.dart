import 'package:flutter/material.dart';

class MultiplayerScreen extends StatelessWidget {
  const MultiplayerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mode Multijoueur'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Startup Battle',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Affrontez d\'autres entrepreneurs et dominez le marché virtuel !',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 24),
            _buildFeatureCard(
              context,
              'Créer une partie',
              'Invitez vos amis à rejoindre votre partie',
              Icons.add_circle,
              Colors.green,
            ),
            const SizedBox(height: 16),
            _buildFeatureCard(
              context,
              'Rejoindre une partie',
              'Rejoignez une partie existante avec un code',
              Icons.login,
              Colors.blue,
            ),
            const SizedBox(height: 16),
            _buildFeatureCard(
              context,
              'Partie rapide',
              'Rejoignez une partie aléatoire avec d\'autres joueurs',
              Icons.flash_on,
              Colors.orange,
            ),
            const SizedBox(height: 24),
            const Text(
              'Classement',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: _buildLeaderboard(context),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFeatureCard(
    BuildContext context,
    String title,
    String subtitle,
    IconData icon,
    Color color,
  ) {
    return Card(
      child: InkWell(
        onTap: () {
          _showComingSoonDialog(context);
        },
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  color: color.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(
                  icon,
                  color: color,
                  size: 30,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      subtitle,
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey[600],
                      ),
                    ),
                  ],
                ),
              ),
              Icon(
                Icons.arrow_forward_ios,
                color: Colors.grey[400],
                size: 16,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLeaderboard(BuildContext context) {
    // Sample leaderboard data
    final leaderboardData = [
      {'name': 'TechWizard', 'score': 1250, 'avatar': 'https://i.pravatar.cc/150?img=1'},
      {'name': 'BusinessGuru', 'score': 980, 'avatar': 'https://i.pravatar.cc/150?img=2'},
      {'name': 'StartupMaster', 'score': 875, 'avatar': 'https://i.pravatar.cc/150?img=3'},
      {'name': 'InnovationKing', 'score': 750, 'avatar': 'https://i.pravatar.cc/150?img=4'},
      {'name': 'VentureQueen', 'score': 720, 'avatar': 'https://i.pravatar.cc/150?img=5'},
    ];

    return ListView.builder(
      itemCount: leaderboardData.length,
      itemBuilder: (context, index) {
        final player = leaderboardData[index];
        return Card(
          margin: const EdgeInsets.only(bottom: 8),
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.grey[200],
              child: Text('${index + 1}'),
            ),
            title: Text(
              player['name'] as String,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Text('${player['score']} points'),
            trailing: const Icon(Icons.emoji_events, color: Colors.amber),
          ),
        );
      },
    );
  }

  void _showComingSoonDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Fonctionnalité à venir'),
        content: const Text(
          'Cette fonctionnalité sera disponible dans la prochaine mise à jour. Restez à l\'écoute !',
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }
}

