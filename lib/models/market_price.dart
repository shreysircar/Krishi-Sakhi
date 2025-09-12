// lib/models/market_price.dart
class MarketPrice {
  final String crop;
  final String market; // e.g., "Alappuzha"
  final double price; // price per quintal / kg (choose unit)
  final DateTime date;

  const MarketPrice({
    required this.crop,
    required this.market,
    required this.price,
    required this.date,
  });
}
