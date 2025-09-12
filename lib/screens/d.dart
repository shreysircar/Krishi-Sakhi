// lib/screens/d.dart
import 'package:flutter/material.dart';
import '../models/market_price.dart';
import '../services/market_service.dart';
import '../widgets/price_table.dart';
import '../widgets/price_charts.dart';

class MarketScreen extends StatefulWidget {
  const MarketScreen({super.key});

  @override
  State<MarketScreen> createState() => _MarketScreenState();
}

class _MarketScreenState extends State<MarketScreen> {
  late List<MarketPrice> _latest;
  late List<MarketPrice> _historyForSelected;
  String _selectedCrop = '';

  @override
  void initState() {
    super.initState();
    _latest = MarketService.getLatestPrices();
    _selectedCrop = _latest.isNotEmpty ? _latest.first.crop : '';
    _historyForSelected = MarketService.getHistoricalForCrop(_selectedCrop);
  }

  void _onRowTap(MarketPrice p) {
    setState(() {
      _selectedCrop = p.crop;
      _historyForSelected = MarketService.getHistoricalForCrop(_selectedCrop);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Selected ${p.crop} — showing recent trend')),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Market Prices (Kerala)',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xFFAF4C0F),
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
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // Top charts with padding for axes spacing
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: PriceCharts(
                currentPrices: _latest,
                historicalForSelected: _historyForSelected,
                selectedCrop: _selectedCrop,

              ),
            ),
            const SizedBox(height: 12),

            // Scrollable Price Table
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: PriceTable(
                    prices: _latest,
                    onSelect: _onRowTap,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
