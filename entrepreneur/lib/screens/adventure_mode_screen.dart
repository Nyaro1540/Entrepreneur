import 'package:flutter/material.dart';
import 'package:entrepreneur/widgets/business_card.dart';
import 'package:entrepreneur/widgets/quest_card.dart';
import 'package:entrepreneur/models/business.dart';
import 'package:entrepreneur/models/quest.dart';

class AdventureModeScreen extends StatefulWidget {
  const AdventureModeScreen({Key? key}) : super(key: key);

  @override
  State<AdventureModeScreen> createState() => _AdventureModeScreenState();
}

class _AdventureModeScreenState extends State<AdventureModeScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  // Sample data - in a real app, this would come from a service or database
  final List<Business> _businesses = [
    Business(
      id: '1',
      name: 'TechInnovate',
      type: BusinessType.tech,
      description:
          'Une startup de développement d\'applications mobiles innovantes',
      value: 50000,
      revenue: 5000,
      expenses: 3000,
      employees: 3,
      customerSatisfaction: 75,
    ),
    Business(
      id: '2',
      name: 'GreenEats',
      type: BusinessType.food,
      description: 'Restaurant de cuisine bio et locale',
      value: 35000,
      revenue: 8000,
      expenses: 6000,
      employees: 5,
      customerSatisfaction: 82,
    ),
  ];

  final List<Quest> _availableQuests = [
    Quest(
      id: '1',
      title: 'Premier Pitch',
      description:
          'Préparez et présentez votre premier pitch à un investisseur potentiel',
      difficulty: QuestDifficulty.easy,
      experienceReward: 50,
      moneyReward: 1000,
      skillRewards: {'negotiation': 2, 'creativity': 1},
      requirements: [],
      steps: [
        'Créez un pitch de 30 secondes',
        'Présentez-le à un mentor virtuel',
        'Obtenez un financement initial',
      ],
    ),
    Quest(
      id: '2',
      title: 'Étude de Marché',
      description:
          'Réalisez une étude de marché pour valider votre idée d\'entreprise',
      difficulty: QuestDifficulty.medium,
      experienceReward: 75,
      moneyReward: 500,
      skillRewards: {'marketing': 2, 'finance': 1},
      requirements: [],
      steps: [
        'Identifiez votre public cible',
        'Analysez la concurrence',
        'Déterminez votre avantage concurrentiel',
      ],
    ),
    Quest(
      id: '3',
      title: 'Recrutement',
      description:
          'Recrutez votre premier employé pour développer votre entreprise',
      difficulty: QuestDifficulty.medium,
      experienceReward: 100,
      moneyReward: 0,
      skillRewards: {'leadership': 3},
      requirements: ['Premier Pitch'],
      steps: [
        'Rédigez une offre d\'emploi',
        'Menez des entretiens avec des candidats',
        'Sélectionnez le meilleur candidat',
      ],
    ),
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mode Aventure'),
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(text: 'Mes Entreprises'),
            Tab(text: 'Quêtes Disponibles'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          // Businesses Tab
          _businesses.isEmpty
              ? _buildEmptyBusinessesView()
              : ListView.builder(
                padding: const EdgeInsets.all(16),
                itemCount: _businesses.length,
                itemBuilder: (context, index) {
                  return BusinessCard(business: _businesses[index]);
                },
              ),

          // Quests Tab
          ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: _availableQuests.length,
            itemBuilder: (context, index) {
              return QuestCard(quest: _availableQuests[index]);
            },
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showCreateBusinessDialog();
        },
        child: const Icon(Icons.add),
        tooltip: 'Créer une entreprise',
      ),
    );
  }

  Widget _buildEmptyBusinessesView() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.business, size: 80, color: Colors.grey.withOpacity(0.5)),
          const SizedBox(height: 16),
          Text(
            'Vous n\'avez pas encore d\'entreprise',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: 8),
          Text(
            'Commencez votre aventure en créant votre première entreprise',
            style: Theme.of(context).textTheme.bodyMedium,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 24),
          ElevatedButton.icon(
            onPressed: () {
              _showCreateBusinessDialog();
            },
            icon: const Icon(Icons.add),
            label: const Text('Créer une entreprise'),
          ),
        ],
      ),
    );
  }

  void _showCreateBusinessDialog() {
    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            title: const Text('Créer une nouvelle entreprise'),
            content: const Text(
              'Cette fonctionnalité sera disponible dans la prochaine mise à jour !',
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
