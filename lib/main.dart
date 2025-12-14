import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'harry_screen.dart';
import 'model/harry_model.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(HarryModelAdapter());

  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: HarryScreen(),
  ));
}
