import 'package:Madhumeha/widgets/primaryButton.dart';
import 'package:flutter/material.dart';
import 'package:Madhumeha/models/diabetesInput.dart';

class ResultsBMI extends StatefulWidget {
  final DiabetesInputModel diabetesInput;
  //jadi stateful soalnya mau menyimpan data ke model
  ResultsBMI({required this.diabetesInput});

  @override
  _ResultsBMIState createState() => _ResultsBMIState();
}

class _ResultsBMIState extends State<ResultsBMI> {
  late double bmi;
  late String category;

  @override
  void initState() {
    super.initState();
    _calculateAndSetBMI();
  }

  void _calculateAndSetBMI() {
    double height = widget.diabetesInput.height ?? 0.0; //karena tipe double? (nullable double) dan height disini height disini double tidak boleh null, maka buat nullaware operator
    double weight = widget.diabetesInput.weight ?? 0.0;

    if (height == 0 || weight == 0) {
      bmi = 0;
      category = "Please enter valid values";
      return;
    }

    bmi = weight / ((height / 100) * (height / 100));
    widget.diabetesInput.bmi = bmi; // Menyimpan BMI ke model

    if (bmi < 18.5) {
      category = "Underweight";
    } else if (bmi >= 18.5 && bmi < 24.9) {
      category = "Normal";
    } else if (bmi >= 25 && bmi < 29.9) {
      category = "Overweight";
    } else {
      category = "Obese";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(height: 40),
          Text(
            'Your BMI',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headlineLarge,
          ),
          Expanded(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(height: 40),
                    Text(
                      category, // Menampilkan kategori BMI
                      style: Theme.of(context).textTheme.headlineLarge,
                    ),
                    const SizedBox(height: 40),
                    Text(
                      bmi == 0 ? "Invalid" : bmi.toStringAsFixed(2), // Menampilkan hasil BMI
                      style: Theme.of(context).textTheme.headlineLarge,
                    ),
                    const SizedBox(height: 40),
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
                        const SizedBox(width: 8),
                        Expanded(
                          child: PrimaryButton(
                            label: 'Next',
                            color: Theme.of(context).primaryColor,
                            textColor: Theme.of(context).scaffoldBackgroundColor,
                            width: 180,
                            onPressed: () {
                              // Tambahkan navigasi ke screen berikutnya
                            },
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
