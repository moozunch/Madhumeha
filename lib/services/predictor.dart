import 'package:tflite_flutter/tflite_flutter.dart';
import 'package:Madhumeha/models/diabetesInput.dart';
import 'dart:math';

class PredictorService {
  static const List<double> center = [
    55.0, 27.72298756, 0.0, 10.1738647, 5.24900246, 4.88856587, 7.09469216, 0.0, 0.0, 0.0, 0.0, 0.0,
    134.0, 90.0, 137.39824069, 7.09573209, 2.85510509, 28.19014699, 225.12011163, 124.91802315,
    60.45698771, 228.41742899, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 4.85191433, 0.0, 0.0, 0.0, 47.51969339,
    0.0, 0.0, 0.0, 1.98716992, 4.84388584, 5.0352081
  ];

  static const List<double> scale = [
    35.0, 12.3864788, 1.0, 10.49563401, 4.9203795, 4.87925624, 3.04202476, 1.0, 1.0, 1.0, 1.0, 1.0,
    44.0, 30.0, 65.02089249, 2.97935574, 2.24366016, 21.33428949, 76.59637267, 73.81349785,
    40.04714962, 172.53501421, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 5.15202424, 1.0, 1.0, 1.0, 48.90908097,
    1.0, 1.0, 1.0, 1.88821703, 5.09390954, 5.17675197
  ];

  static Future<int> predict(DiabetesInputModel input) async {
    final interpreter = await Interpreter.fromAsset('assets/models/modeld.tflite');

    // Testing for Raw input
    final inputList = input.toList();
    print('🔎 Raw input values:');
    for (int i = 0; i < inputList.length; i++) {
      print('Feature $i: ${inputList[i]}');
    }

    // Testing for Standardized input
    final scaledInput = List.generate(inputList.length, (i) {
      if (scale[i] == 0) return 0.0; // Avoid division by zero
      return (inputList[i] - center[i]) / scale[i];
    });

    print('🧪 Scaled (Robust) input values:');
    for (int i = 0; i < scaledInput.length; i++) {
      print('Feature $i: ${scaledInput[i]}');
    }

    final inputTensor = [scaledInput];
    final output = List.filled(1 * 1, 0).reshape([1, 1]);

    interpreter.run(inputTensor, output);
    double prediction = output[0][0];

    print("🧠 Prediction value: $prediction");
    return prediction > 0.5 ? 1 : 0;
  }
}
