// lib/widgets/price_table.dart
import 'package:flutter/material.dart';
import '../models/market_price.dart';

typedef PriceRowTap = void Function(MarketPrice price);

class PriceTable extends StatelessWidget {
  final List<MarketPrice> prices;
  final PriceRowTap? onSelect;

  const PriceTable({super.key, required this.prices, this.onSelect});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.all(8),
        child: DataTable(
          headingRowColor: MaterialStateProperty.all(const Color(0xFFAF4C0F)),
          headingTextStyle: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          dataRowHeight: 60,
          columns: const [
            DataColumn(label: Text("Crop")),
            DataColumn(label: Text("Market")),
            DataColumn(label: Text("Price")),
            DataColumn(label: Text("Date")),
          ],
          rows: prices.map((p) {
            return DataRow(
              cells: [
                DataCell(Text(p.crop, style: const TextStyle(fontWeight: FontWeight.bold))),
                DataCell(Text(p.market)),
                DataCell(Text("${p.price.toStringAsFixed(0)} ₹")),
                DataCell(Text("${p.date.day}/${p.date.month}/${p.date.year}")),
              ],
              onSelectChanged: (_) {
                if (onSelect != null) onSelect!(p);
              },
            );
          }).toList(),
        ),
      ),
    );
  }
}
