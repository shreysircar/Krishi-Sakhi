import 'package:flutter/material.dart';
import '../models/alert.dart';
import '../utils/navigator_key.dart';

class NewsCard extends StatelessWidget {
  final Alert alert;

  const NewsCard({super.key, required this.alert});

  @override
  Widget build(BuildContext context) {
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
      onTap: () => _showLocationDialog(alert.location),
      child: Card(
        margin: const EdgeInsets.symmetric(vertical: 8),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
        elevation: 5,
        child: ListTile(
          leading: CircleAvatar(
            backgroundColor: color.withOpacity(0.2),
            child: Icon(icon, color: color),
          ),
          title: Text(
            alert.title,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          subtitle: Text(alert.description),
          trailing: Icon(Icons.arrow_forward, color: Colors.orange),
        ),
      ),
    );
  }

  void _showLocationDialog(String location) {
    showDialog(
      context: navigatorKey.currentContext!,
      builder: (context) => AlertDialog(
        title: Text("Location: $location"),
        content: const Text("Map integration coming soon!"),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Close"),
          ),
        ],
      ),
    );
  }
}
