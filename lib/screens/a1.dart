import 'package:flutter/material.dart';
import '../models/crop.dart';
import '../widgets/crop_card.dart';
import 'a.dart'; // English dashboard

class DashboardScreenML extends StatelessWidget {
  final String farmerName = "രാജേഷ് കുമാർ";
  final String landSize = "5 ഏക്കർ";
  final String location = "തൃശൂർ";

  DashboardScreenML({super.key});

  final List<Crop> crops = [
    Crop(
      name: "ഗോവി",
      sowingTime: "ജനുവരി 10 - ജനുവരി 25",
      irrigationTime: "ഏഴ് ദിവസങ്ങൾക്ക് ഓരോ തവണ",
      soilType: "മണ്ണിന്റെ തരം: ലോമി മണ്ണ്",
      progress: 0.65,
    ),
    Crop(
      name: "അരിപ്പ്",
      sowingTime: "ജൂൺ 15 - ജൂലൈ 5",
      irrigationTime: "അഞ്ച് ദിവസങ്ങൾക്ക് ഓരോ തവണ",
      soilType: "മണ്ണിന്റെ തരം: മഞ്ഞ് മണ്ണ്",
      progress: 0.40,
    ),
    Crop(
      name: "മക്കൾ",
      sowingTime: "മാർച്ച് 1 - മാർച്ച് 15",
      irrigationTime: "പത്തുദിവസങ്ങൾക്ക് ഓരോ തവണ",
      soilType: "മണ്ണിന്റെ തരം: മണൽ ലോം",
      progress: 0.85,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffffbd59),
      appBar: AppBar(
        backgroundColor: const Color(0xFFaf4c0f),
        elevation: 0,
        title: const Text(
          "അന്നദാത ഡാഷ്ബോർഡ്",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
        ),
        centerTitle: true,
        actions: [
          // Toggle button to switch back to English dashboard
          IconButton(
            icon: const Icon(Icons.language, color: Colors.white),
            tooltip: 'Switch to English',
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (_) => DashboardScreen()),
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
                      _infoChip(Icons.landscape, "നിലമാറ്റം", landSize),
                      _infoChip(Icons.location_on, "സ്ഥലം", location),
                    ],
                  ),
                ],
              ),
            ),

            // Crops Header
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                "നിങ്ങളുടെ വിളകൾ",
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
