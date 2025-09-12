/*class Crop {
  final String name;
  final String sowingTime;
  final String irrigationTime;
  final String soilType;
  final double progress; // 0.0 → 1.0

  Crop({
    required this.name,
    required this.sowingTime,
    required this.irrigationTime,
    required this.soilType,
    required this.progress,
  });
}
*/
class Crop {
  final String name;
  final String sowingTime;
  final String irrigationTime;
  final String soilType;
  final double progress;

  // New fields
  final String? image; // URL or asset path
  final String? shortDescription; // shown in card
  final String? description; // detailed info
  final String? estimatedHarvestDate; // e.g., "March 20, 2026"
  final String? tips; // farming tips

  Crop({
    required this.name,
    required this.sowingTime,
    required this.irrigationTime,
    required this.soilType,
    required this.progress,
    this.image,
    this.shortDescription,
    this.description,
    this.estimatedHarvestDate,
    this.tips,
  });
}
