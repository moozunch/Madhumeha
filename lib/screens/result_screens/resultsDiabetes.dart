import 'package:flutter/material.dart';
import 'package:Madhumeha/widgets/primaryButton.dart';
import 'package:Madhumeha/models/diabetesInput.dart';
import 'package:Madhumeha/screens/input_screens/lifestyle.dart';

class ResultsDiabetes extends StatefulWidget {
  final DiabetesInputModel diabetesInput;

  const ResultsDiabetes({super.key, required this.diabetesInput});

  @override
  _ResultsDiabetesState createState() => _ResultsDiabetesState();
}

class _ResultsDiabetesState extends State<ResultsDiabetes> {
  @override
  Widget build(BuildContext context) {
    final int result = ModalRoute.of(context)!.settings.arguments as int;
    final bool isPositive = result == 1;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Prediction Result'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          const SizedBox(height: 40),
          Text(
            'Your Result',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headlineLarge,
          ),
          const SizedBox(height: 20),
          Expanded(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      isPositive ? Icons.warning_amber_rounded : Icons.check_circle,
                      size: 100,
                      color: isPositive ? Colors.red : Colors.green,
                    ),
                    const SizedBox(height: 20),
                    Text(
                      isPositive
                          ? 'High Risk of Diabetes'
                          : 'Low Risk of Diabetes',
                      style: TextStyle(
                        fontSize: 24,
                        color: isPositive ? Colors.red : Colors.green,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Text(
                        isPositive
                            ? 'This prediction is for informational purposes and may be inaccurate. Further clinical evaluation is recommended.'
                            : 'This prediction is for informational purposes and may be inaccurate. Clinical judgment and further evaluation are advised if symptoms persist or if clinically indicated.',
                        style: Theme.of(context).textTheme.bodyLarge,
                        textAlign: TextAlign.center,
                      ),
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
