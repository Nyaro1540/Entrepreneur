enum QuestDifficulty {
  easy,
  medium,
  hard,
  expert
}

class Quest {
  final String id;
  final String title;
  final String description;
  final QuestDifficulty difficulty;
  final int experienceReward;
  final double moneyReward;
  final Map<String, int> skillRewards;
  final List<String> requirements;
  final List<String> steps;

  Quest({
    required this.id,
    required this.title,
    required this.description,
    required this.difficulty,
    required this.experienceReward,
    required this.moneyReward,
    required this.skillRewards,
    required this.requirements,
    required this.steps,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'difficulty': difficulty.toString(),
      'experienceReward': experienceReward,
      'moneyReward': moneyReward,
      'skillRewards': skillRewards,
      'requirements': requirements,
      'steps': steps,
    };
  }

  factory Quest.fromJson(Map<String, dynamic> json) {
    return Quest(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      difficulty: QuestDifficulty.values.firstWhere(
        (e) => e.toString() == json['difficulty'],
        orElse: () => QuestDifficulty.easy,
      ),
      experienceReward: json['experienceReward'],
      moneyReward: json['moneyReward'],
      skillRewards: Map<String, int>.from(json['skillRewards']),
      requirements: List<String>.from(json['requirements']),
      steps: List<String>.from(json['steps']),
    );
  }
}

