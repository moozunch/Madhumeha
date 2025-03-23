import 'package:Madhumeha/widgets/primaryButton.dart';
import 'package:flutter/material.dart';

class ResultsBMI extends StatelessWidget {
  final TextEditingController heightController;
  final TextEditingController weightController;

  ResultsBMI({
    required this.heightController,
    required this.weightController,
  });

  /// Menghitung BMI dan menentukan kategori
  Map<String, dynamic> calculateBMI() {
    double height = double.tryParse(heightController.text) ?? 0;
    double weight = double.tryParse(weightController.text) ?? 0;

    if (height == 0 || weight == 0) {
      return {
        "bmi": "Invalid",
        "category": "Please enter valid values",
      };
    }

    double bmi = weight / ((height / 100) * (height / 100));

    String category;
    if (bmi < 18.5) {
      category = "Underweight";
    } else if (bmi >= 18.5 && bmi < 24.9) {
      category = "Normal";
    } else if (bmi >= 25 && bmi < 29.9) {
      category = "Overweight";
    } else {
      category = "Obese";
    }

    return {
      "bmi": bmi.toStringAsFixed(2),
      "category": category,
    };
  }

  @override
  Widget build(BuildContext context) {
    final result = calculateBMI();

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
                      result["category"], // Menampilkan kategori
                      style: Theme.of(context).textTheme.headlineLarge,
                    ),
                    const SizedBox(height: 40),
                    Text(
                      result["bmi"], // Menampilkan hasil BMI
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
