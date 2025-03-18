import 'package:Madhumeha/widgets/primaryButton.dart';
import 'package:flutter/material.dart';
import 'package:Madhumeha/widgets/inputBox.dart';
import 'package:Madhumeha/screens/input_screens/resultsBMI.dart';


class BMI extends StatefulWidget {
  BMI(
  {super.key});
  @override
  State<StatefulWidget> createState() => _BMIState();
}

class _BMIState extends State<BMI> {
  //Input Box - numberPicker
  final TextEditingController heightController = TextEditingController();
  final TextEditingController weightController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 40),
                  SizedBox(
                    child:
                      Text(
                        textAlign: TextAlign.start,
                        'Body Mass Index',
                        style: Theme.of(context).textTheme.headlineLarge,
                      ),
                  ),
                  SizedBox(
                    child:
                      Text(
                        textAlign: TextAlign.start,
                        'You can change this information later',
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                  ),
                  SizedBox(height: 40),
                  InputBox(
                      label: 'Height',
                      controller: heightController,
                      isNumberPicker: true,
                      min: 50,
                      max: 280,
                      hint: 'cm',
                      onNumberPicked: (value) {
                        heightController.text = value.toString();
                      },
                  ),
                  SizedBox(height: 20),
                  InputBox(
                    label: 'Weight',
                    controller: weightController,
                    isNumberPicker: true,
                    min: 0,
                    max: 500,
                    hint: 'kg',
                    onNumberPicked: (value) {
                      weightController.text = value.toString();
                    },
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
                              }),),
                        SizedBox(width: 8),
                        Expanded(
                            child: PrimaryButton(
                                label: 'Next',
                                color: Theme.of(context).primaryColor,
                                textColor: Theme.of(context).scaffoldBackgroundColor,
                                width: 180,
                                onPressed: () {
                                  Navigator.push(context,
                                      MaterialPageRoute(builder: (context) => ResultsBMI()));
                                })
                        ),
                      ]
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
