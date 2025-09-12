
import '../models/market_price.dart';

class MarketService {
  // Returns sample latest prices for multiple crops in Kerala
  static List<MarketPrice> getLatestPrices() {
    final now = DateTime.now();
    return [
      MarketPrice(crop: 'Rice', market: 'Palakkad', price: 2100.0, date: now),
      MarketPrice(crop: 'Paddy', market: 'Kozhikode', price: 1950.0, date: now),
      MarketPrice(crop: 'Wheat', market: 'Thrissur', price: 2600.0, date: now),
      MarketPrice(crop: 'Maize', market: 'Kottayam', price: 1400.0, date: now),
      MarketPrice(crop: 'Coconut', market: 'Alappuzha', price: 1800.0, date: now),
      MarketPrice(crop: 'Banana', market: 'Kannur', price: 1200.0, date: now),
    ];
  }

  // Returns fake historical series (last 7 days) for a crop (for line chart)
  static List<MarketPrice> getHistoricalForCrop(String crop) {
    final today = DateTime.now();
    final rng = <double>[0.0]; // dummy; we'll compute variations
    // base price depends on crop (roughly)
    double base;
    switch (crop.toLowerCase()) {
      case 'rice':
      case 'paddy':
        base = 2000;
        break;
      case 'wheat':
        base = 2600;
        break;
      case 'maize':
        base = 1400;
        break;
      case 'coconut':
        base = 1800;
        break;
      case 'banana':
        base = 1200;
        break;
      default:
        base = 1500;
    }

    List<MarketPrice> hist = List.generate(7, (i) {
      final date = today.subtract(Duration(days: 6 - i));
      // small random-ish wobble based on i for deterministic variation
      final price = base + ((i - 3) * 20 + (i % 2 == 0 ? 15 : -10));
      return MarketPrice(crop: crop, market: 'Kerala (avg)', price: price, date: date);
    });

    return hist;
  }
}
