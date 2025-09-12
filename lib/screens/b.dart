import 'package:flutter/material.dart';
import '../models/alert.dart';
import '../widgets/news_list.dart';

class NewsScreen extends StatelessWidget {
  NewsScreen({super.key});

  final List<Alert> staticAlerts = [
    Alert(
      title: "Pest Attack Alert",
      description:
      "A nearby farm in Thrissur is facing a pest attack. Take precautions!",
      type: "pest",
      location: "Thrissur",
    ),
    Alert(
      title: "Rain Expected",
      description: "Heavy rain expected in 2 hours. Protect your crops.",
      type: "rain",
      location: "Kozhikode",
    ),
    Alert(
      title: "Fertilizer Recommendation",
      description: "Nitrogen fertilizer recommended for wheat crop growth.",
      type: "fertilizer",
      location: "Palakkad",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            "News & Alerts",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
        backgroundColor: const Color(0xFFaf4c0f),
        elevation: 0,
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFAF4C0F), Color(0xFFFFBD59)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: NewsList(alerts: staticAlerts),
        ),
      ),
    );
  }
}
