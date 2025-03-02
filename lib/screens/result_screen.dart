// lib/screens/result_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../controllers/nic_controller.dart';

class ResultScreen extends StatelessWidget {
  ResultScreen({super.key});
  final NICController nicController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("NIC Details"),
        actions: [
          IconButton(
            icon: const Icon(Icons.history),
            onPressed: () => Get.toNamed('/history'),
          )
        ],
      ),
      body: Obx(() {
        if (nicController.decodedNIC.isEmpty) {
          return const Center(child: Text("No data available"));
        }

        final data = nicController.decodedNIC;
        return ListView(
          padding: const EdgeInsets.all(16),
          children: [
            _buildDetailRow("NIC Type", data["NIC Type"]),
            _buildDetailRow("Date of Birth", data["Date of Birth"]),
            _buildDetailRow("Weekday", data["Weekday"]),
            _buildDetailRow("Age", "${data["Age"]} years"),
            _buildDetailRow("Gender", data["Gender"]),
            _buildDetailRow("Serial Number", data["Serial Number"]),
            if (data.containsKey("Vote Eligibility"))
              _buildDetailRow("Vote Eligibility", data["Vote Eligibility"]),
          ],
        );
      }),
    );
  }

  Widget _buildDetailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Text("$label: ", style: const TextStyle(fontWeight: FontWeight.bold)),
          Expanded(child: Text(value)),
          IconButton(
            icon: const Icon(Icons.copy, size: 18),
            onPressed: () => Clipboard.setData(ClipboardData(text: value)),
          ),
        ],
      ),
    );
  }
}
