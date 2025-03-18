import 'package:Madhumeha/widgets/primaryButton.dart';
import 'package:flutter/material.dart';
import 'package:Madhumeha/widgets/inputBox.dart';

class ResultsBMI extends StatelessWidget {
  @override
  String category = "Normal";
  double bmi = 0.0;

  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(height: 40),
          SizedBox(
            child: Text(
              'Your BMI',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headlineLarge,
            ),
          ),
          Expanded(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 40),
                  SizedBox(
                    child: Text(
                      "$category",
                      style: Theme.of(context).textTheme.headlineLarge,
                    ),
                  ),
                  SizedBox(height: 40),
                  SizedBox(
                    child: Text(
                      "$bmi",
                      style: Theme.of(context).textTheme.headlineLarge,
                    ),
                  ),
                  SizedBox(height: 40),
                  Row(
                    children: [
                      Expanded(
                        child: PrimaryButton(
                          label: 'Back',
                          isToggle: true,
                          color: Theme.of(context).primaryColorDark,
                          textColor: Theme.of(context).scaffoldBackgroundColor,
                          width: 180,
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                      ),
                      SizedBox(width: 8),
                      Expanded(
                        child: PrimaryButton(
                          label: 'Next',
                          color: Theme.of(context).primaryColor,
                          textColor: Theme.of(context).scaffoldBackgroundColor,
                          width: 180,
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => ResultsBMI()));
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}