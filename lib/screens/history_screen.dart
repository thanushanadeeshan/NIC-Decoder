// lib/screens/history_screen.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/nic_controller.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final NICController controller = Get.find();
    return Scaffold(
      appBar: AppBar(
        title: const Text("History"),
        actions: [
          IconButton(
            icon: const Icon(Icons.delete),
            onPressed: controller.clearHistory,
          )
        ],
      ),
      body: Obx(() => ListView.separated(
            padding: const EdgeInsets.all(16),
            itemCount: controller.history.length,
            separatorBuilder: (_, __) => const Divider(),
            itemBuilder: (context, index) {
              final entry = controller.history[index];
              return ListTile(
                title: Text("${entry["Date of Birth"]} (${entry["Gender"]})"),
                subtitle: Text("NIC: ${entry["NIC Type"]}"),
                trailing: IconButton(
                  icon: const Icon(Icons.delete),
                  onPressed: () => controller.history.removeAt(index),
                ),
              );
            },
          )),
    );
  }
}
