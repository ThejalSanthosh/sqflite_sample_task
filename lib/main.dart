import 'package:flutter/material.dart';
import 'package:sqflite_sample_task/controller/home_screen_controller.dart';
import 'package:sqflite_sample_task/view/home_screen/home_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
 await HomeScreenController.initDb();
   runApp(MainScreen());
}

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      home: HomeScreen(),
    );
  }
}