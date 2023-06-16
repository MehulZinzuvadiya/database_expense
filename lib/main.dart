import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';

import 'AddData/view/add_data.dart';
import 'HistoryFilter/view/history_screen.dart';
import 'HomeScreen/view/home_Screen.dart';

void main() {
  runApp(GetMaterialApp(debugShowCheckedModeBanner: false, getPages: [
    GetPage(name: '/', page: () => Homescreen()),
    GetPage(name: '/income', page: () => AddDataScreen()),
    GetPage(name: '/transaction', page: () => HistoryScreen()),
  ]));
}
