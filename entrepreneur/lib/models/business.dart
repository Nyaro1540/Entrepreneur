enum BusinessType {
  tech,
  food,
  retail,
  service,
  manufacturing,
}

class Business {
  final String id;
  final String name;
  final BusinessType type;
  final String description;
  double value;
  double revenue;
  double expenses;
  int employees;
  int customerSatisfaction;
  Map<String, int> stats;

  Business({
    required this.id,
    required this.name,
    required this.type,
    required this.description,
    this.value = 0.0,
    this.revenue = 0.0,
    this.expenses = 0.0,
    this.employees = 0,
    this.customerSatisfaction = 50,
    Map<String, int>? stats,
  }) : stats = stats ?? {
    'innovation': 1,
    'marketing': 1,
    'operations': 1,
    'finance': 1,
    'teamwork': 1,
  };

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'type': type.toString(),
      'description': description,
      'value': value,
      'revenue': revenue,
      'expenses': expenses,
      'employees': employees,
      'customerSatisfaction': customerSatisfaction,
      'stats': stats,
    };
  }

  factory Business.fromJson(Map<String, dynamic> json) {
    return Business(
      id: json['id'],
      name: json['name'],
      type: BusinessType.values.firstWhere(
        (e) => e.toString() == json['type'],
        orElse: () => BusinessType.tech,
      ),
      description: json['description'],
      value: json['value'],
      revenue: json['revenue'],
      expenses: json['expenses'],
      employees: json['employees'],
      customerSatisfaction: json['customerSatisfaction'],
      stats: Map<String, int>.from(json['stats']),
    );
  }

  double calculateProfit() {
    return revenue - expenses;
  }

  void updateValue() {
    // Simple formula to calculate business value
    double profitMargin = revenue > 0 ? (revenue - expenses) / revenue : 0;
    value = (revenue * 12) * (1 + (profitMargin * 2)) * (customerSatisfaction / 50);
  }

  void improveStat(String stat, int amount) {
    if (stats.containsKey(stat)) {
      stats[stat] = (stats[stat] ?? 0) + amount;
    }
  }
}

