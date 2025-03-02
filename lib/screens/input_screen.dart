// lib/screens/input_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../controllers/nic_controller.dart';

class InputScreen extends StatelessWidget {
  InputScreen({super.key});
  final NICController nicController = Get.put(NICController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("NIC Decoder"),
        actions: [
          IconButton(
            icon: const Icon(Icons.history),
            onPressed: () => Get.toNamed('/history'),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(
                  controller: nicController.nicInputController,
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.grey[100],
                    hintText: "Enter NIC (e.g., 199912345678)",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none,
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 24,
                      vertical: 18,
                    ),
                  ),
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp(r'[0-9VXvx-]')),
                    LengthLimitingTextInputFormatter(15),
                  ],
                  onChanged: (value) => nicController.autoFormatNIC(value),
                ),
                const SizedBox(height: 16),
                Obx(() => Text(
                      nicController.isValidNIC.value
                          ? "✓ Valid format"
                          : "⚠ Use format: 123456789V or 199912345678",
                      style: TextStyle(
                        color: nicController.isValidNIC.value
                            ? Colors.green
                            : Colors.orange,
                      ),
                    )),
                const SizedBox(height: 32),
                ElevatedButton(
                  onPressed: nicController.decodeNIC,
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 40,
                      vertical: 16,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text(
                    "DECODE NOW",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Wrap(
                  spacing: 8,
                  children: [
                    ActionChip(
                      label: const Text("Sample Old NIC"),
                      onPressed: () =>
                          nicController.nicInputController.text = "853400937V",
                    ),
                    ActionChip(
                      label: const Text("Sample New NIC"),
                      onPressed: () => nicController.nicInputController.text =
                          "199534000937",
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
