import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  // Farmer details
  String farmerName = "Rajesh Kumar";
  String landSize = "5 Acres";
  String location = "Thrissur";

  // Example crops
  List<String> crops = ["Wheat", "Rice", "Maize"];

  // Controllers for editing
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _landController = TextEditingController();
  final TextEditingController _locationController = TextEditingController();
  final TextEditingController _newCropController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _nameController.text = farmerName;
    _landController.text = landSize;
    _locationController.text = location;
  }

  @override
  void dispose() {
    _nameController.dispose();
    _landController.dispose();
    _locationController.dispose();
    _newCropController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Annadata Profile",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
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
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Profile Avatar
              Stack(
                alignment: Alignment.bottomRight,
                children: [
                  CircleAvatar(
                    radius: 55,
                    backgroundColor: const Color(0xF7A66B48),
                    child: Text(
                      farmerName[0],
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 40,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 4,
                    child: Container(
                      decoration: BoxDecoration(
                        color: const Color(0xFFAF4C0F),
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.white, width: 2),
                      ),
                      child: IconButton(
                        icon: const Icon(Icons.edit, color: Colors.white, size: 20),
                        onPressed: () {},
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 25),

              // Farmer Details Card
              Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25)),
                elevation: 10,
                shadowColor: Colors.orange.shade300,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 20),
                  child: Column(
                    children: [
                      _buildEditableField("Name", _nameController, Icons.person),
                      const SizedBox(height: 15),
                      _buildEditableField("Land Size", _landController, Icons.landscape),
                      const SizedBox(height: 15),
                      _buildEditableField("Location", _locationController, Icons.location_city),
                      const SizedBox(height: 25),
                      ElevatedButton.icon(
                        onPressed: () {
                          setState(() {
                            farmerName = _nameController.text;
                            landSize = _landController.text;
                            location = _locationController.text;
                          });
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text("Details Updated!")),
                          );
                        },
                        icon: const Icon(Icons.save, color: Colors.white),
                        label: const Text(
                          "Save Changes",
                          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFAF4C0F),
                          padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 20),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                          elevation: 6,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 30),

              // Crops Section
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Your Crops",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.white70,
                  ),
                ),
              ),
              const SizedBox(height: 15),
              Wrap(
                spacing: 10,
                runSpacing: 10,
                children: crops
                    .map(
                      (crop) => Chip(
                    label: Text(crop),
                    backgroundColor: Colors.orange.shade100,
                    labelStyle: const TextStyle(fontWeight: FontWeight.bold),
                    deleteIcon: const Icon(Icons.close),
                    onDeleted: () {
                      setState(() {
                        crops.remove(crop);
                      });
                    },
                  ),
                )
                    .toList(),
              ),
              const SizedBox(height: 20),

              // Add New Crop Card
              Card(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                elevation: 6,
                shadowColor: Colors.orange.shade200,
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: _newCropController,
                          decoration: const InputDecoration(
                            hintText: "Add new crop",
                            border: OutlineInputBorder(),
                            contentPadding:
                            EdgeInsets.symmetric(vertical: 12, horizontal: 12),
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      ElevatedButton(
                        onPressed: () {
                          if (_newCropController.text.isNotEmpty) {
                            setState(() {
                              crops.add(_newCropController.text);
                              _newCropController.clear();
                            });
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFAF4C0F),
                          padding: const EdgeInsets.all(14),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                          elevation: 5,
                        ),
                        child: const Icon(Icons.add, color: Colors.white),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildEditableField(String label, TextEditingController controller, IconData icon) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        prefixIcon: Icon(icon, color: const Color(0xFFAF4C0F)),
        labelText: label,
        labelStyle: TextStyle(color: Colors.orange.shade700, fontWeight: FontWeight.bold),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(color: Color(0xFFAF4C0F), width: 2),
        ),
      ),
    );
  }
}
