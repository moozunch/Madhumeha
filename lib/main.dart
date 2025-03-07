import 'package:flutter/material.dart';
import 'themes/appTheme.dart';
import 'screens/boardingScreen.dart';
// import 'package:tflite_flutter/tflite_flutter.dart';

void main() {
  runApp(MadhumehaApp());
}

class MadhumehaApp extends StatefulWidget {
  const MadhumehaApp({super.key});

  @override
  State<MadhumehaApp> createState() => _MadhumehaAppState();
}

class _MadhumehaAppState extends State<MadhumehaApp> {
  bool isDarkMode = false;

  void toggleTheme() {
    setState(() {
      isDarkMode = !isDarkMode;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Madhumeha',
      theme: isDarkMode ? AppTheme.dark : AppTheme.light,
      home: const BoardingScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomePage extends StatelessWidget {
  final VoidCallback toggleTheme;

   const HomePage({required this.toggleTheme});

   @override
  Widget build(BuildContext context) {
     return Scaffold(
       appBar: AppBar(
         title: Text('Madhumeha'),
       )
     );
   }
}
