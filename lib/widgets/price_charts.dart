import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import '../models/market_price.dart';

class PriceCharts extends StatelessWidget {
  final List<MarketPrice> currentPrices;
  final List<MarketPrice> historicalForSelected;
  final String selectedCrop;

  const PriceCharts({
    super.key,
    required this.currentPrices,
    required this.historicalForSelected,
    required this.selectedCrop,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      color: Colors.white.withOpacity(0.9),
      child: SizedBox(
        height: 220,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: LineChart(
            LineChartData(
              gridData: FlGridData(show: true, drawVerticalLine: false),
              titlesData: FlTitlesData(
                bottomTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: true,
                    reservedSize: 32, // spacing from chart to X-axis
                    interval: 1,
                    getTitlesWidget: (value, meta) {
                      final index = value.toInt();
                      if (index >= 0 && index < historicalForSelected.length) {
                        return Padding(
                          padding: const EdgeInsets.only(top: 6.0),
                          child: Text(
                            "${historicalForSelected[index].date.day}/${historicalForSelected[index].date.month}",
                            style: const TextStyle(fontSize: 12),
                          ),
                        );
                      }
                      return const Text('');
                    },
                  ),
                ),
                leftTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: true,
                    reservedSize: 50, // more space for Y-axis numbers
                    interval: _calculateYInterval(),
                    getTitlesWidget: (value, meta) {
                      return Padding(
                        padding: const EdgeInsets.only(right: 6.0),
                        child: Text(
                          value.toInt().toString(),
                          style: const TextStyle(fontSize: 12),
                        ),
                      );
                    },
                  ),
                ),
              ),
              borderData: FlBorderData(show: false),
              lineBarsData: [
                LineChartBarData(
                  spots: historicalForSelected
                      .asMap()
                      .entries
                      .map((e) => FlSpot(e.key.toDouble(), e.value.price))
                      .toList(),
                // smooth curve
                  color: Colors.orange.shade700,
                  barWidth: 3,
                  dotData: FlDotData(show: true),
                  belowBarData: BarAreaData(
                    show: true,
                    color: Colors.orange.withOpacity(0.2),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Dynamically calculate Y-axis interval to avoid overlapping
  double _calculateYInterval() {
    if (historicalForSelected.isEmpty) return 1;
    double maxPrice = historicalForSelected.map((e) => e.price).reduce((a, b) => a > b ? a : b);
    return (maxPrice / 5).ceilToDouble(); // 5 intervals
  }
}
