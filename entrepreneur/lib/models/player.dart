class Player {
  final String id;
  final String name;
  String avatarUrl;
  int level;
  int experience;
  double money;
  Map<String, int> skills;
  List<String> completedQuests;
  List<String> ownedBusinesses;

  Player({
    required this.id,
    required this.name,
    required this.avatarUrl,
    this.level = 1,
    this.experience = 0,
    this.money = 1000.0,
    Map<String, int>? skills,
    List<String>? completedQuests,
    List<String>? ownedBusinesses,
  }) : 
    skills = skills ?? {
      'creativity': 1,
      'leadership': 1,
      'negotiation': 1,
      'marketing': 1,
      'finance': 1,
      'resilience': 1,
    },
    completedQuests = completedQuests ?? [],
    ownedBusinesses = ownedBusinesses ?? [];

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'avatarUrl': avatarUrl,
      'level': level,
      'experience': experience,
      'money': money,
      'skills': skills,
      'completedQuests': completedQuests,
      'ownedBusinesses': ownedBusinesses,
    };
  }

  factory Player.fromJson(Map<String, dynamic> json) {
    return Player(
      id: json['id'],
      name: json['name'],
      avatarUrl: json['avatarUrl'],
      level: json['level'],
      experience: json['experience'],
      money: json['money'],
      skills: Map<String, int>.from(json['skills']),
      completedQuests: List<String>.from(json['completedQuests']),
      ownedBusinesses: List<String>.from(json['ownedBusinesses']),
    );
  }

  void addExperience(int amount) {
    experience += amount;
    // Check if player should level up
    if (experience >= levelUpThreshold()) {
      level++;
    }
  }

  int levelUpThreshold() {
    // Simple formula: 100 * current level
    return 100 * level;
  }

  void improveSkill(String skill, int amount) {
    if (skills.containsKey(skill)) {
      skills[skill] = (skills[skill] ?? 0) + amount;
    }
  }
}

