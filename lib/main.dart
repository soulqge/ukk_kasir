import "package:flutter/material.dart";
import 'package:ukk_kasir/data/model_data.dart';
import 'package:ukk_kasir/pages/admin/dashboard.dart';
import 'package:ukk_kasir/pages/admin/navbar.dart';
import 'package:ukk_kasir/pages/kasir/cashier.dart';
import 'package:ukk_kasir/pages/login/login.dart';
import 'package:ukk_kasir/pages/login/loginpage.dart';

void main() {
  runApp(const MyApp());
} 

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Wikusama Cafe',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
        useMaterial3: true,
      ),
      home: HomeScreen(),
    );
  }
}