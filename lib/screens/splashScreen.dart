import 'package:Madhumeha/screens/boardingScreen.dart';
import 'package:flutter/material.dart';
import 'inputScreen.dart';
// import 'package:animated_text_kit/animated_text_kit.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Menutup keyboard jika terbuka
    WidgetsBinding.instance.addPostFrameCallback((_) {
      FocusScope.of(context).unfocus();
    });
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => BoardingScreen())
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.import_contacts),
            SizedBox(height: 20),
            Text(
                'Madhumeha',
              style: Theme.of(context).textTheme.bodyMedium, 
            ),
            SizedBox(height: 10),
            Text(
              'Your Personal Diabetes diagnosis assistant for healthy lifestyle',
              style: Theme.of(context).textTheme.bodyMedium, textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            CircularProgressIndicator(color: Colors.white),
          ],
        ),
      )
    );
  }
}
