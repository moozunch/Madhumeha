import 'package:Madhumeha/screens/input_screens/personalInformation.dart';
import 'package:flutter/material.dart';
import 'package:Madhumeha/widgets/primaryButton.dart';


class BoardingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.import_contacts),
            SizedBox(height: 20,),
            Text(
              'Healthy lifestyle.dart kamu dimulai sekarang. \n Before we start let’s fill all \nthe information first.',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w600),
              textAlign: TextAlign.center,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
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