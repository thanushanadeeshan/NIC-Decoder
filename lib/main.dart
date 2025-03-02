// lib/main.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'screens/input_screen.dart';
import 'screens/result_screen.dart';
import 'screens/history_screen.dart';

void main() async {
  await GetStorage.init();
  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    title: "NIC Decoder",
    initialRoute: '/',
    getPages: [
      GetPage(name: '/', page: () => InputScreen()),
      GetPage(name: '/result', page: () => ResultScreen()),
      GetPage(name: '/history', page: () => const HistoryScreen()),
    ],
  ));
}
