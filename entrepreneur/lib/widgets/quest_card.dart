import 'package:flutter/material.dart';
import 'package:entrepreneur/models/quest.dart';

class QuestCard extends StatelessWidget {
  final Quest quest;

  const QuestCard({super.key, required this.quest});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                _buildQuestDifficultyBadge(quest.difficulty),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    quest.title,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Text(quest.description, style: const TextStyle(fontSize: 14)),
            const SizedBox(height: 16),
            _buildRewardsSection(context),
            if (quest.requirements.isNotEmpty) ...[
              const SizedBox(height: 12),
              _buildRequirementsSection(context),
            ],
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                OutlinedButton(onPressed: () {}, child: const Text('Détails')),
                const SizedBox(width: 8),
                ElevatedButton(
                  onPressed: () {
                    _showQuestDetailsDialog(context);
                  },
                  child: const Text('Commencer'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildQuestDifficultyBadge(QuestDifficulty difficulty) {
    Color color;
    String label;

    switch (difficulty) {
      case QuestDifficulty.easy:
        color = Colors.green;
        label = 'Facile';
        break;
      case QuestDifficulty.medium:
        color = Colors.orange;
        label = 'Moyen';
        break;
      case QuestDifficulty.hard:
        color = Colors.red;
        label = 'Difficile';
        break;
      case QuestDifficulty.expert:
        color = Colors.purple;
        label = 'Expert';
        break;
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        border: Border.all(color: color),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: color,
          fontSize: 12,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildRewardsSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Récompenses:',
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            _buildRewardItem(
              context,
              Icons.star,
              '${quest.experienceReward} XP',
              Colors.amber,
            ),
            const SizedBox(width: 16),
            _buildRewardItem(
              context,
              Icons.attach_money,
              '${quest.moneyReward.toStringAsFixed(0)} €',
              Colors.green,
            ),
            const SizedBox(width: 16),
            ...quest.skillRewards.entries.map((entry) {
              return _buildRewardItem(
                context,
                Icons.trending_up,
                '+${entry.value} ${_getSkillLabel(entry.key)}',
                Colors.blue,
              );
            }),
          ],
        ),
      ],
    );
  }

  Widget _buildRequirementsSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Prérequis:',
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: quest.requirements.map((req) {
            return Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 8,
                vertical: 4,
              ),
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.1),
                borderRadius: BorderRadius.circular(4),
              ),
              child: Text(
                req,
                style: TextStyle(fontSize: 12, color: Colors.grey[700]),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }

  Widget _buildRewardItem(
    BuildContext context,
    IconData icon,
    String label,
    Color color,
  ) {
    return Row(
      children: [
        Icon(icon, color: color, size: 16),
        const SizedBox(width: 4),
        Text(label, style: TextStyle(fontSize: 14, color: color)),
      ],
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

  void _showQuestDetailsDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(quest.title),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(quest.description),
            const SizedBox(height: 16),
            const Text(
              'Étapes:',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            ...quest.steps.asMap().entries.map((entry) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('${entry.key + 1}. '),
                    Expanded(child: Text(entry.value)),
                  ],
                ),
              );
            }),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('Annuler'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop();
              // Start the quest
            },
            child: const Text('Commencer'),
          ),
        ],
      ),
    );
  }
}
