import 'package:entrepreneur/models/business.dart';
import 'package:flutter/material.dart';

class BusinessCard extends StatelessWidget {
  final Business business;

  const BusinessCard({Key? key, required this.business}) : super(key: key);

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
                _buildBusinessIcon(),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        business.name,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        _getBusinessTypeLabel(business.type),
                        style: TextStyle(
                          fontSize: 14,
                          color: Theme.of(context).colorScheme.secondary,
                        ),
                      ),
                    ],
                  ),
                ),
                _buildBusinessValue(),
              ],
            ),
            const SizedBox(height: 16),
            Text(business.description, style: const TextStyle(fontSize: 14)),
            const SizedBox(height: 16),
            _buildBusinessStats(context),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                OutlinedButton(
                  onPressed: () {},
                  child: const Text('Statistiques'),
                ),
                const SizedBox(width: 8),
                ElevatedButton(onPressed: () {}, child: const Text('Gérer')),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBusinessIcon() {
    IconData iconData;
    Color iconColor;

    switch (business.type) {
      case BusinessType.tech:
        iconData = Icons.computer;
        iconColor = Colors.blue;
        break;
      case BusinessType.food:
        iconData = Icons.restaurant;
        iconColor = Colors.orange;
        break;
      case BusinessType.retail:
        iconData = Icons.shopping_bag;
        iconColor = Colors.purple;
        break;
      case BusinessType.service:
        iconData = Icons.build;
        iconColor = Colors.green;
        break;
      case BusinessType.manufacturing:
        iconData = Icons.precision_manufacturing;
        iconColor = Colors.red;
        break;
    }

    return Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        color: iconColor.withOpacity(0.1),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Icon(iconData, color: iconColor, size: 30),
    );
  }

  Widget _buildBusinessValue() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          '${business.value.toStringAsFixed(0)} €',
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        Text('Valeur', style: TextStyle(fontSize: 12, color: Colors.grey[600])),
      ],
    );
  }

  Widget _buildBusinessStats(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _buildStatItem(
          context,
          Icons.attach_money,
          '${business.revenue.toStringAsFixed(0)} €',
          'Revenus',
          Colors.green,
        ),
        _buildStatItem(
          context,
          Icons.money_off,
          '${business.expenses.toStringAsFixed(0)} €',
          'Dépenses',
          Colors.red,
        ),
        _buildStatItem(
          context,
          Icons.people,
          '${business.employees}',
          'Employés',
          Colors.blue,
        ),
        _buildStatItem(
          context,
          Icons.thumb_up,
          '${business.customerSatisfaction}%',
          'Satisfaction',
          Colors.amber,
        ),
      ],
    );
  }

  Widget _buildStatItem(
    BuildContext context,
    IconData icon,
    String value,
    String label,
    Color color,
  ) {
    return Column(
      children: [
        Icon(icon, color: color, size: 20),
        const SizedBox(height: 4),
        Text(
          value,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
        ),
        Text(label, style: TextStyle(fontSize: 12, color: Colors.grey[600])),
      ],
    );
  }

  String _getBusinessTypeLabel(BusinessType type) {
    switch (type) {
      case BusinessType.tech:
        return 'Technologie';
      case BusinessType.food:
        return 'Restauration';
      case BusinessType.retail:
        return 'Commerce';
      case BusinessType.service:
        return 'Service';
      case BusinessType.manufacturing:
        return 'Fabrication';
    }
  }
}
