/*import 'package:flutter/material.dart';
import '../models/crop.dart';
import '../widgets/crop_card.dart';
import 'a1.dart';

class DashboardScreen extends StatelessWidget {
  final String farmerName = "Rajesh Kumar";
  final String landSize = "5 Acres";
  final String location = "Thrissur";

  DashboardScreen({super.key});

  final List<Crop> crops = [
    Crop(
      name: "Wheat",
      sowingTime: "Jan 10 - Jan 25",
      irrigationTime: "Every 7 days",
      soilType: "Loamy Soil",
      progress: 0.65,
    ),
    Crop(
      name: "Rice",
      sowingTime: "June 15 - July 5",
      irrigationTime: "Every 5 days",
      soilType: "Clay Soil",
      progress: 0.40,
    ),
    Crop(
      name: "Maize",
      sowingTime: "March 1 - March 15",
      irrigationTime: "Every 10 days",
      soilType: "Sandy Loam",
      progress: 0.85,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffffbd59), // light yellow bg
      appBar: AppBar(
        backgroundColor: const Color(0xFFaf4c0f), // brown header
        elevation: 0,
        title: const Text(
          "Annadata Dashboard",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Farmer Info Section with gradient
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(24),
              margin: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [const Color(0xFFaf4c0f), Colors.deepOrange.shade300],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(24),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.15),
                    blurRadius: 10,
                    offset: const Offset(0, 6),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    farmerName,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _infoChip(Icons.landscape, "Land Size", landSize),
                      _infoChip(Icons.location_on, "Location", location),
                    ],
                  ),
                ],
              ),
            ),

            // Crops Header
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                "Your Crops",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.brown.shade800,
                ),
              ),
            ),
            const SizedBox(height: 16),

            // Crop Cards
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: crops.map((crop) => CropCard(crop: crop)).toList(),
              ),
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  // reusable chip widget for info
  Widget _infoChip(IconData icon, String label, String value) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 14),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.15),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Icon(icon, size: 18, color: Colors.white),
          const SizedBox(width: 6),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(label,
                  style: const TextStyle(
                      fontSize: 12, color: Colors.white70, height: 1.2)),
              Text(value,
                  style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.white)),
            ],
          ),
        ],
      ),
    );
  }
}
*/

import 'package:flutter/material.dart';
import '../models/crop.dart';
import '../widgets/crop_card.dart';
import 'a1.dart'; // Malayalam dashboard

class DashboardScreen extends StatelessWidget {
  final String farmerName = "Rajesh Kumar";
  final String landSize = "5 Acres";
  final String location = "Thrissur";

  DashboardScreen({super.key});

  final List<Crop> crops = [
    Crop(
      name: "Wheat",
      sowingTime: "Jan 10 - Jan 25",
      irrigationTime: "Every 7 days",
      soilType: "Loamy Soil",
      progress: 0.65,
    ),
    Crop(
      name: "Rice",
      sowingTime: "June 15 - July 5",
      irrigationTime: "Every 5 days",
      soilType: "Clay Soil",
      progress: 0.40,
    ),
    Crop(
      name: "Maize",
      sowingTime: "March 1 - March 15",
      irrigationTime: "Every 10 days",
      soilType: "Sandy Loam",
      progress: 0.85,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffffbd59), // light yellow bg
      appBar: AppBar(
        backgroundColor: const Color(0xFFaf4c0f), // brown header
        elevation: 0,
        title: const Text(
          "Annadata Dashboard",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
        ),
        centerTitle: true,
        actions: [
          // Toggle button to switch to Malayalam dashboard
          IconButton(
            icon: const Icon(Icons.language, color: Colors.white),
            tooltip: 'Switch to Malayalam',
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (_) => DashboardScreenML()),
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Farmer Info Section with gradient
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(24),
              margin: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [const Color(0xFFaf4c0f), Colors.deepOrange.shade300],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(24),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.15),
                    blurRadius: 10,
                    offset: const Offset(0, 6),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    farmerName,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _infoChip(Icons.landscape, "Land Size", landSize),
                      _infoChip(Icons.location_on, "Location", location),
                    ],
                  ),
                ],
              ),
            ),

            // Crops Header
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                "Your Crops",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.brown.shade800,
                ),
              ),
            ),
            const SizedBox(height: 16),

            // Crop Cards
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: crops.map((crop) => CropCard(crop: crop)).toList(),
              ),
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  // reusable chip widget for info
  Widget _infoChip(IconData icon, String label, String value) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 14),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.15),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Icon(icon, size: 18, color: Colors.white),
          const SizedBox(width: 6),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(label,
                  style: const TextStyle(
                      fontSize: 12, color: Colors.white70, height: 1.2)),
              Text(value,
                  style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.white)),
            ],
          ),
        ],
      ),
    );
  }
}
