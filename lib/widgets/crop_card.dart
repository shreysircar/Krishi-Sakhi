/*import 'package:flutter/material.dart';
import '../models/crop.dart';
import 'package:percent_indicator/percent_indicator.dart';

class CropCard extends StatelessWidget {
  final Crop crop;

  const CropCard({super.key, required this.crop});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigate to crop detail
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => CropDetailScreen(crop: crop),
          ),
        );
      },
      child: Card(
        margin: const EdgeInsets.symmetric(vertical: 12, horizontal: 10),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        elevation: 6,
        shadowColor: Colors.orange.shade200,
        child: Container(
          padding: const EdgeInsets.all(18),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            gradient: LinearGradient(
              colors: [Colors.orange.shade50, Colors.white],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Row(
            children: [
              // Crop Image / Icon Circle
              CircleAvatar(
                radius: 30,
                backgroundColor: Colors.orange.shade400,
                backgroundImage: crop.image != null
                    ? NetworkImage(crop.image!)
                    : null,
                child: crop.image == null
                    ? Text(
                        crop.name[0],
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    : null,
              ),
              const SizedBox(width: 16),

              // Crop Info
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      crop.name,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFFaf4c0f),
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      crop.shortDescription ?? "Healthy crop growing tips",
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.black87,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 10),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: LinearProgressIndicator(
                        value: crop.progress,
                        backgroundColor: Colors.grey[300],
                        color: const Color(0xFFaf4c0f),
                        minHeight: 10,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      "${(crop.progress * 100).toStringAsFixed(0)}% completed",
                      style: const TextStyle(fontSize: 13, color: Colors.black87),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/*
class CropDetailScreen extends StatelessWidget {
  final Crop crop;

  const CropDetailScreen({super.key, required this.crop});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${crop.name} Details"),
        backgroundColor: const Color(0xFFaf4c0f),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          elevation: 8,
          shadowColor: Colors.orange.shade200,
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Crop Image
                if (crop.image != null)
                  ClipRRect(
                    borderRadius: BorderRadius.circular(18),
                    child: Image.network(
                      crop.image!,
                      height: 180,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                const SizedBox(height: 20),
                Text(
                  crop.name,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFFaf4c0f),
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  crop.description ?? "Detailed crop information here.",
                  style: const TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 20),
                Text("Sowing Time: ${crop.sowingTime}",
                    style: const TextStyle(fontSize: 16)),
                const SizedBox(height: 10),
                Text("Irrigation: ${crop.irrigationTime}",
                    style: const TextStyle(fontSize: 16)),
                const SizedBox(height: 10),
                Text("Soil Type: ${crop.soilType}",
                    style: const TextStyle(fontSize: 16)),
                const SizedBox(height: 10),
                if (crop.estimatedHarvestDate != null)
                  Text("Estimated Harvest: ${crop.estimatedHarvestDate}",
                      style: const TextStyle(fontSize: 16)),
                const SizedBox(height: 20),
                const Text("Progress",
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                const SizedBox(height: 10),
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: LinearProgressIndicator(
                    value: crop.progress,
                    backgroundColor: Colors.grey[300],
                    color: const Color(0xFFaf4c0f),
                    minHeight: 14,
                  ),
                ),
                const SizedBox(height: 10),
                Text("${(crop.progress * 100).toStringAsFixed(0)}% completed",
                    style: const TextStyle(fontSize: 16)),
                const SizedBox(height: 20),
                if (crop.tips != null)
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("Tips & Recommendations",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold)),
                      const SizedBox(height: 10),
                      Text(
                        crop.tips!,
                        style: const TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
*/


class CropDetailScreen extends StatelessWidget {
  final Crop crop;

  const CropDetailScreen({super.key, required this.crop});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Image or Gradient
          Container(
            height: 280,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.orange.shade200, Colors.white],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
              image: crop.image != null
                  ? DecorationImage(
                image: NetworkImage(crop.image!),
                fit: BoxFit.cover,
              )
                  : null,
            ),
          ),
          // AppBar
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.orange.shade300,
                    child: IconButton(
                      icon: const Icon(Icons.arrow_back, color: Colors.white),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Details Card
          DraggableScrollableSheet(
            initialChildSize: 0.65,
            minChildSize: 0.65,
            maxChildSize: 0.95,
            builder: (context, scrollController) => Container(
              padding: const EdgeInsets.all(20),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 15,
                    offset: Offset(0, -5),
                  )
                ],
              ),
              child: SingleChildScrollView(
                controller: scrollController,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Crop Name + Circular Progress
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            crop.name,
                            style: const TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFFaf4c0f),
                            ),
                          ),
                        ),
                        CircularPercentIndicator(
                          radius: 60,
                          lineWidth: 8,
                          percent: crop.progress,
                          center: Text(
                              "${(crop.progress * 100).toStringAsFixed(0)}%"),
                          progressColor: Colors.orange.shade400,
                          backgroundColor: Colors.grey.shade200,
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),

                    // Estimated Harvest
                    if (crop.estimatedHarvestDate != null)
                      Row(
                        children: [
                          const Icon(Icons.calendar_today, color: Colors.orange),
                          const SizedBox(width: 8),
                          Text(
                            "Harvest: ${crop.estimatedHarvestDate}",
                            style: const TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                    const SizedBox(height: 20),

                    // Sowing, Irrigation, Soil Type
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _infoCard(Icons.grass, "Sowing", crop.sowingTime),
                        _infoCard(Icons.water_drop, "Irrigation", crop.irrigationTime),
                        _infoCard(Icons.terrain, "Soil", crop.soilType),
                      ],
                    ),
                    const SizedBox(height: 20),

                    // Description
                    Text(
                      "About Crop",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.orange.shade700),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      crop.description ?? "Detailed crop information here.",
                      style: const TextStyle(fontSize: 16),
                    ),
                    const SizedBox(height: 20),

                    // Tips
                    if (crop.tips != null)
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Tips & Recommendations",
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.orange.shade700),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            crop.tips!,
                            style: const TextStyle(fontSize: 16),
                          ),
                        ],
                      ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Small card for Sowing/Irrigation/Soil
  Widget _infoCard(IconData icon, String title, String value) {
    return Container(
      padding: const EdgeInsets.all(12),
      width: 100,
      decoration: BoxDecoration(
        color: Colors.orange.shade50,
        borderRadius: BorderRadius.circular(15),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 8,
            offset: Offset(0, 3),
          )
        ],
      ),
      child: Column(
        children: [
          Icon(icon, color: Colors.orange.shade400, size: 28),
          const SizedBox(height: 6),
          Text(
            title,
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
          ),
          const SizedBox(height: 4),
          Text(
            value,
            style: const TextStyle(fontSize: 12, color: Colors.black87),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}*/

import 'package:flutter/material.dart';
import '../models/crop.dart';
import 'package:percent_indicator/percent_indicator.dart';

class CropCard extends StatelessWidget {
  final Crop crop;

  const CropCard({super.key, required this.crop});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigate to crop detail
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => CropDetailScreen(crop: crop),
          ),
        );
      },
      child: Card(
        margin: const EdgeInsets.symmetric(vertical: 12, horizontal: 10),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        elevation: 6,
        shadowColor: Colors.orange.shade200,
        child: Container(
          padding: const EdgeInsets.all(18),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            gradient: LinearGradient(
              colors: [Colors.orange.shade50, Colors.white],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Row(
            children: [
              // Crop Image / Icon Circle
              CircleAvatar(
                radius: 30,
                backgroundColor: Colors.orange.shade400,
                backgroundImage: crop.image != null
                    ? NetworkImage(crop.image!)
                    : null,
                child: crop.image == null
                    ? Text(
                  crop.name[0],
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                )
                    : null,
              ),
              const SizedBox(width: 16),

              // Crop Info
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      crop.name,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFFaf4c0f),
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      crop.shortDescription ?? "Healthy crop growing tips",
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.black87,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 10),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: LinearProgressIndicator(
                        value: crop.progress,
                        backgroundColor: Colors.grey[300],
                        color: const Color(0xFFaf4c0f),
                        minHeight: 10,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      "${(crop.progress * 100).toStringAsFixed(0)}% completed",
                      style: const TextStyle(fontSize: 13, color: Colors.black87),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CropDetailScreen extends StatelessWidget {
  final Crop crop;

  const CropDetailScreen({super.key, required this.crop});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Image or Gradient
          Container(
            height: 280,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.orange.shade200, Colors.white],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
              image: crop.image != null
                  ? DecorationImage(
                image: NetworkImage(crop.image!),
                fit: BoxFit.cover,
              )
                  : null,
            ),
          ),
          // AppBar
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.orange.shade300,
                    child: IconButton(
                      icon: const Icon(Icons.arrow_back, color: Colors.white),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Details Card
          DraggableScrollableSheet(
            initialChildSize: 0.65,
            minChildSize: 0.65,
            maxChildSize: 0.95,
            builder: (context, scrollController) =>
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.vertical(
                        top: Radius.circular(30)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 15,
                        offset: Offset(0, -5),
                      )
                    ],
                  ),
                  child: SingleChildScrollView(
                    controller: scrollController,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Crop Name + Circular Progress
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                crop.name,
                                style: const TextStyle(
                                  fontSize: 28,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFFaf4c0f),
                                ),
                              ),
                            ),
                            CircularPercentIndicator(
                              radius: 60,
                              lineWidth: 8,
                              percent: crop.progress,
                              center: Text(
                                  "${(crop.progress * 100).toStringAsFixed(
                                      0)}%"),
                              progressColor: Colors.orange.shade400,
                              backgroundColor: Colors.grey.shade200,
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),

                        // Estimated Harvest
                        if (crop.estimatedHarvestDate != null)
                          Row(
                            children: [
                              const Icon(Icons.calendar_today, color: Colors
                                  .orange),
                              const SizedBox(width: 8),
                              Text(
                                "Harvest: ${crop.estimatedHarvestDate}",
                                style: const TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                        const SizedBox(height: 20),

                        // Sowing, Irrigation, Soil Type
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(child: _infoCard(Icons.grass, "Sowing",
                                crop.sowingTime)),
                            const SizedBox(width: 8),
                            Expanded(child: _infoCard(Icons.water_drop,
                                "Irrigation", crop.irrigationTime)),
                            const SizedBox(width: 8),
                            Expanded(child: _infoCard(Icons.terrain, "Soil",
                                crop.soilType)),
                          ],
                        ),
                        const SizedBox(height: 20),

                        // Description
                        Text(
                          "About Crop",
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.orange.shade700),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          crop.description ?? "Detailed crop information here.",
                          style: const TextStyle(fontSize: 16),
                        ),
                        const SizedBox(height: 20),

                        // Tips
                        if (crop.tips != null)
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Tips & Recommendations",
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.orange.shade700),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                crop.tips!,
                                style: const TextStyle(fontSize: 16),
                              ),
                            ],
                          ),
                      ],
                    ),
                  ),
                ),
          ),
        ],
      ),
    );
  }

  // Small card for Sowing/Irrigation/Soil
  Widget _infoCard(IconData icon, String title, String value) {
    return Container(
      padding: const EdgeInsets.all(12),
      constraints: const BoxConstraints(minHeight: 100), // ensures min height
      decoration: BoxDecoration(
        color: Colors.orange.shade50,
        borderRadius: BorderRadius.circular(15),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 8,
            offset: Offset(0, 3),
          )
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: Colors.orange.shade400, size: 28),
          const SizedBox(height: 6),
          Text(
            title,
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
          ),
          const SizedBox(height: 4),
          Text(
            value,
            style: const TextStyle(fontSize: 12, color: Colors.black87),
            textAlign: TextAlign.center,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}

