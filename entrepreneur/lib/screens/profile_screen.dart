import 'package:flutter/material.dart';
import 'package:entrepreneur/models/player.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Sample player data - in a real app, this would come from a service or database
    final player = Player(
      id: '1',
      name: 'Entrepreneur',
      avatarUrl: 'https://i.pravatar.cc/300',
      level: 5,
      experience: 450,
      money: 15000,
      skills: {
        'creativity': 3,
        'leadership': 2,
        'negotiation': 4,
        'marketing': 3,
        'finance': 2,
        'resilience': 5,
      },
      completedQuests: ['Premier Pitch', 'Étude de Marché'],
      ownedBusinesses: ['TechInnovate', 'GreenEats'],
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Profil'),
        actions: [
          IconButton(icon: const Icon(Icons.settings), onPressed: () {}),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildProfileHeader(context, player),
            const SizedBox(height: 16),
            _buildStatsSection(context, player),
            const SizedBox(height: 16),
            _buildSkillsSection(context, player),
            const SizedBox(height: 16),
            _buildAchievementsSection(context, player),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileHeader(BuildContext context, Player player) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(color: Theme.of(context).primaryColor),
      child: Column(
        children: [
          CircleAvatar(
            radius: 50,
            backgroundColor: Colors.white,
            child: const Icon(Icons.person, size: 60, color: Colors.grey),
          ),
          const SizedBox(height: 16),
          Text(
            player.name,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Niveau ${player.level} • Entrepreneur',
            style: TextStyle(
              fontSize: 16,
              color: Colors.white.withOpacity(0.8),
            ),
          ),
          const SizedBox(height: 16),
          _buildExperienceBar(context, player),
        ],
      ),
    );
  }

  Widget _buildExperienceBar(BuildContext context, Player player) {
    final experienceNeeded = player.levelUpThreshold();
    final progress = player.experience / experienceNeeded;

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'XP: ${player.experience}/${experienceNeeded}',
              style: TextStyle(
                fontSize: 14,
                color: Colors.white.withOpacity(0.8),
              ),
            ),
            Text(
              '${(progress * 100).toStringAsFixed(0)}%',
              style: TextStyle(
                fontSize: 14,
                color: Colors.white.withOpacity(0.8),
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        ClipRRect(
          borderRadius: BorderRadius.circular(4),
          child: LinearProgressIndicator(
            value: progress,
            minHeight: 10,
            backgroundColor: Colors.white.withOpacity(0.2),
            valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
          ),
        ),
      ],
    );
  }

  Widget _buildStatsSection(BuildContext context, Player player) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Statistiques',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildStatItem(
                context,
                Icons.attach_money,
                '${player.money.toStringAsFixed(0)} €',
                'Capital',
              ),
              _buildStatItem(
                context,
                Icons.business,
                '${player.ownedBusinesses.length}',
                'Entreprises',
              ),
              _buildStatItem(
                context,
                Icons.assignment_turned_in,
                '${player.completedQuests.length}',
                'Quêtes',
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildStatItem(
    BuildContext context,
    IconData icon,
    String value,
    String label,
  ) {
    return Column(
      children: [
        Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor.withOpacity(0.1),
            shape: BoxShape.circle,
          ),
          child: Icon(icon, color: Theme.of(context).primaryColor, size: 30),
        ),
        const SizedBox(height: 8),
        Text(
          value,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        Text(label, style: TextStyle(fontSize: 14, color: Colors.grey[600])),
      ],
    );
  }

  Widget _buildSkillsSection(BuildContext context, Player player) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Compétences',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          ...player.skills.entries.map((entry) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        _getSkillLabel(entry.key),
                        style: const TextStyle(fontSize: 16),
                      ),
                      Text(
                        '${entry.value}/10',
                        style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(4),
                    child: LinearProgressIndicator(
                      value: entry.value / 10,
                      minHeight: 8,
                      backgroundColor: Colors.grey[200],
                      valueColor: AlwaysStoppedAnimation<Color>(
                        _getSkillColor(entry.key),
                      ),
                    ),
                  ),
                ],
              ),
            );
          }).toList(),
        ],
      ),
    );
  }

  Widget _buildAchievementsSection(BuildContext context, Player player) {
    // Sample achievements
    final achievements = [
      {
        'title': 'Premier Pas',
        'description': 'Créez votre première entreprise',
        'icon': Icons.emoji_events,
        'completed': true,
      },
      {
        'title': 'Investisseur',
        'description': 'Obtenez votre premier financement',
        'icon': Icons.monetization_on,
        'completed': true,
      },
      {
        'title': 'Innovateur',
        'description': 'Lancez un produit révolutionnaire',
        'icon': Icons.lightbulb,
        'completed': false,
      },
      {
        'title': 'Expansion',
        'description': 'Possédez 3 entreprises simultanément',
        'icon': Icons.business_center,
        'completed': false,
      },
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Réalisations',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          ...achievements.map((achievement) {
            return Card(
              margin: const EdgeInsets.only(bottom: 12),
              child: ListTile(
                leading: Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color:
                        achievement['completed'] as bool
                            ? Colors.amber.withOpacity(0.1)
                            : Colors.grey.withOpacity(0.1),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    achievement['icon'] as IconData,
                    color:
                        achievement['completed'] as bool
                            ? Colors.amber
                            : Colors.grey,
                  ),
                ),
                title: Text(
                  achievement['title'] as String,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color:
                        achievement['completed'] as bool ? null : Colors.grey,
                  ),
                ),
                subtitle: Text(achievement['description'] as String),
                trailing:
                    achievement['completed'] as bool
                        ? const Icon(Icons.check_circle, color: Colors.green)
                        : const Icon(Icons.lock, color: Colors.grey),
              ),
            );
          }).toList(),
        ],
      ),
    );
  }

  String _getSkillLabel(String skill) {
    switch (skill) {
      case 'creativity':
        return 'Créativité';
      case 'leadership':
        return 'Leadership';
      case 'negotiation':
        return 'Négociation';
      case 'marketing':
        return 'Marketing';
      case 'finance':
        return 'Finance';
      case 'resilience':
        return 'Résilience';
      default:
        return skill;
    }
  }

  Color _getSkillColor(String skill) {
    switch (skill) {
      case 'creativity':
        return Colors.purple;
      case 'leadership':
        return Colors.blue;
      case 'negotiation':
        return Colors.orange;
      case 'marketing':
        return Colors.red;
      case 'finance':
        return Colors.green;
      case 'resilience':
        return Colors.teal;
      default:
        return Colors.grey;
    }
  }
}
