import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ReportIssueScreen extends StatefulWidget {
  const ReportIssueScreen({super.key});

  @override
  State<ReportIssueScreen> createState() => _ReportIssueScreenState();
}

class _ReportIssueScreenState extends State<ReportIssueScreen> {
  final TextEditingController _issueController = TextEditingController();

  // Sample history issues
  List<Map<String, String>> issues = [
    {"title": "Pest attack on wheat crops", "date": "10/09/2025, 09:30 AM"},
    {"title": "Irrigation water shortage", "date": "09/09/2025, 05:15 PM"},
    {"title": "Leaf spot disease in rice field", "date": "08/09/2025, 02:10 PM"},
  ];

  void _addIssue() {
    if (_issueController.text.isNotEmpty) {
      setState(() {
        issues.insert(0, {
          "title": _issueController.text,
          "date": DateFormat("dd/MM/yyyy, hh:mm a").format(DateTime.now())
        });
        _issueController.clear();
      });
    }
  }

  void _showSOSDialog() {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text("🚨 SOS Triggered"),
        content: const Text(
            "Your emergency alert has been sent to the nearest Krishi Sakhi center!"),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: const Text("OK"),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Report an Issue",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
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
        child: Column(
          children: [
            // Input section
            Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _issueController,
                      decoration: InputDecoration(
                        hintText: "Describe your issue...",
                        filled: true,
                        fillColor: Colors.white.withOpacity(0.9),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  ElevatedButton(
                    onPressed: _addIssue,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white.withOpacity(0.9),
                      padding: const EdgeInsets.all(16),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)),
                    ),
                    child: const Icon(Icons.send, color: Color(0xFFAF4C0F)),
                  )
                ],
              ),
            ),

            // History section (no separate background)
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.all(16),
                itemCount: issues.length,
                itemBuilder: (ctx, index) {
                  final issue = issues[index];
                  return Card(
                    color: Colors.white.withOpacity(0.9),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                    elevation: 6,
                    margin: const EdgeInsets.only(bottom: 15),
                    child: ListTile(
                      leading: const Icon(Icons.report_problem,
                          color: Color(0xFFAF4C0F), size: 30),
                      title: Text(
                        issue["title"]!,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                      subtitle: Text(
                        issue["date"]!,
                        style: TextStyle(color: Colors.grey.shade700),
                      ),
                    ),
                  );
                },
              ),
            ),

            // SOS Button
            Padding(
              padding: const EdgeInsets.all(20),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _showSOSDialog,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    elevation: 6,
                  ),
                  child: const Text(
                    "🚨 SOS Emergency",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
