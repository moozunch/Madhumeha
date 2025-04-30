import 'package:tflite_flutter/tflite_flutter.dart';
import 'package:Madhumeha/models/diabetesInput.dart';

class PredictorService {
  static Future<int> predict(DiabetesInputModel input) async {
    final interpreter = await Interpreter.fromAsset('assets/models/modeld.tflite');

    // Convert input to a 2D list
    final inputList = input.toList(); //pastikan method mengembalikan
    final inpuTensor = [inputList];

    final output = List.filled(1 * 1, 0).reshape([1, 1]);
    interpreter.run(inpuTensor, output);

    double prediction = output[0][0];
    print("Prediction value: $prediction");
    return prediction > 0.5 ? 1 : 0;
  }
}