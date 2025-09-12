import 'package:flutter/material.dart';
import '../models/alert.dart';

class NewsList extends StatelessWidget {
  final List<Alert> alerts;

  const NewsList({super.key, required this.alerts});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(12),
      itemCount: alerts.length,
      itemBuilder: (context, index) {
        final alert = alerts[index];
        return _newsCard(context, alert);
      },
    );
  }

  Widget _newsCard(BuildContext context, Alert alert) {
    IconData icon;
    Color color;

    switch (alert.type) {
      case "pest":
        icon = Icons.bug_report;
        color = Colors.red.shade400;
        break;
      case "rain":
        icon = Icons.cloud;
        color = Colors.blue.shade400;
        break;
      case "fertilizer":
        icon = Icons.grass;
        color = Colors.green.shade400;
        break;
      default:
        icon = Icons.notifications;
        color = Colors.orange.shade400;
    }

    return GestureDetector(
      onTap: () {
        // Click action for alert card
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Clicked: ${alert.title}')),
        );
      },
      child: Card(
        margin: const EdgeInsets.symmetric(vertical: 8),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
        elevation: 6,
        shadowColor: Colors.orange.shade200,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18),
            gradient: LinearGradient(
              colors: [Colors.orange.shade50, Colors.white],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: color.withOpacity(0.2),
              child: Icon(icon, color: color),
            ),
            title: Text(
              alert.title,
              style: const TextStyle(
                  fontWeight: FontWeight.bold, color: Colors.black87),
            ),
            subtitle: Text(alert.description),
            trailing: IconButton(
              icon: Icon(Icons.map, color: Colors.orange.shade700),
              onPressed: () {
                // Optional: show location dialog
                showDialog(
                  context: context,
                  builder: (_) => AlertDialog(
                    title: Text("Location: ${alert.location}"),
                    content: const Text("Map integration coming soon!"),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: const Text("Close"),
                      )
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
