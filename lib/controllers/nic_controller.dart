// lib/controllers/nic_controller.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../utils/nic_decoder.dart'; // Added import

/// The controller for handling NIC decoding logic and UI state.
///
/// This controller:
/// - Manages the NIC input field.
/// - Validates NIC format.
/// - Decodes NIC details.
/// - Stores NIC history using GetStorage.
/// - Navigates between screens using GetX.

class NICController extends GetxController {
  /// The text field controller for NIC input.
  final TextEditingController nicInputController = TextEditingController();

  /// Stores the decoded NIC details.
  final RxMap<String, dynamic> decodedNIC = <String, dynamic>{}.obs;

  /// Indicates whether the NIC format is valid.
  final RxBool isValidNIC = false.obs;

  /// Stores the NIC decoding history.
  final RxList<Map<String, dynamic>> history = <Map<String, dynamic>>[].obs;

  /// Storage instance to persist history data.
  final GetStorage storage = GetStorage();

  @override
  void onInit() {
    history.value = storage.read('nicHistory') ?? [];
    super.onInit();
  }

  void autoFormatNIC(String value) {
    final cleanedValue = value.replaceAll('-', '');
    if (cleanedValue.length == 10 && !value.contains('-')) {
      nicInputController.text =
          '${cleanedValue.substring(0, 2)}-${cleanedValue.substring(2, 5)}'
          '-${cleanedValue.substring(5, 9)}-${cleanedValue.substring(9)}';
      nicInputController.selection =
          TextSelection.collapsed(offset: nicInputController.text.length);
    }
    checkValidity(cleanedValue);
  }

  /// Checks if the NIC number entered is in a valid format.
  void checkValidity(String value) {
    isValidNIC.value = RegExp(r'^(\d{9}[VXvx]|\d{12})$').hasMatch(value);
  }

  void _saveToHistory(Map<String, dynamic> data) {
    if (history.length >= 10) history.removeLast();
    history.insert(0, Map<String, dynamic>.from(data));
    storage.write('nicHistory', history.toList());
  }

  void clearHistory() {
    history.clear();
    storage.remove('nicHistory');
  }

  /// Decodes the NIC and navigates to the results screen.
  void decodeNIC() {
    try {
      final nic =
          nicInputController.text.trim().toUpperCase().replaceAll('-', '');

      if (nic.isEmpty) throw Exception("Please enter a NIC number");

      final isOldFormat = nic.length == 10;
      final isNewFormat = nic.length == 12;

      if (!isOldFormat && !isNewFormat) {
        throw Exception("NIC must be 10 or 12 characters");
      }

      if (isOldFormat && !RegExp(r'^[0-9]{9}[VX]$').hasMatch(nic)) {
        throw Exception("Invalid Old NIC format (e.g., 123456789V)");
      }

      if (isNewFormat && !RegExp(r'^[0-9]{12}$').hasMatch(nic)) {
        throw Exception("Invalid New NIC format (e.g., 199912345678)");
      }

      final decodedData = NICDecoder.decodeNIC(nic);
      decodedNIC.assignAll(decodedData);
      _saveToHistory(decodedData);
      Get.toNamed('/result');
    } catch (e) {
      Get.snackbar("Error", e.toString().replaceAll("Exception: ", ""),
          snackPosition: SnackPosition.BOTTOM,
          duration: const Duration(seconds: 3));
    }
  }
}
