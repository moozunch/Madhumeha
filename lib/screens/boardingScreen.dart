import 'package:Madhumeha/screens/input_screens/personalInformation.dart';
import 'package:flutter/material.dart';
import 'package:Madhumeha/widgets/primaryButton.dart';
import 'package:flutter_svg/flutter_svg.dart';


class BoardingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              'assets/iconsvg.svg',
              width: 100,
              height: 100,
            ),
            SizedBox(height: 20),
            Text(
              'Madhumeha',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 5),
            Text(
              'Diabetes Risk Predictor',
              style: Theme.of(context).textTheme.bodyMedium, textAlign: TextAlign.center,
            ),
            SizedBox(height: 10,),
            PrimaryButton(
                label: 'Start',
                color: Theme.of(context).primaryColor,
                textColor: Theme.of(context).scaffoldBackgroundColor,
                width: 180,
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => PersonalInformation() ));}
            )
          ],
        ),
      ),
    );
  }
}