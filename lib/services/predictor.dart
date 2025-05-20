import 'package:tflite_flutter/tflite_flutter.dart';
import 'package:Madhumeha/models/diabetesInput.dart';

class PredictorService {
  static const List<double> _robustMedians = [
    55.0, 27.72298756, 0.0, 10.1738647, 5.24900246,
    4.88856587, 7.09469216, 0.0, 0.0, 0.0,
    0.0, 0.0, 134.0, 90.0, 137.39824069,
    7.09573209, 2.85510509, 28.19014699, 225.12011163, 124.91802315,
    60.45698771, 228.41742899, 0.0, 0.0, 0.0,
    0.0, 0.0, 0.0, 4.85191433, 0.0,
    0.0, 0.0, 47.51969339, 0.0, 0.0,
    0.0, 1.98716992, 4.84388584, 5.0352081
  ];

  static const List<double> _robustIQRs = [
    35.0, 12.3864788, 1.0, 10.49563401, 4.9203795,
    4.87925624, 3.04202476, 1.0, 1.0, 1.0,
    1.0, 1.0, 44.0, 30.0, 65.02089249,
    2.97935574, 2.24366016, 21.33428949, 76.59637267, 73.81349785,
    40.04714962, 172.53501421, 1.0, 1.0, 1.0,
    1.0, 1.0, 1.0, 5.15202424, 1.0,
    1.0, 1.0, 48.90908097, 1.0, 1.0,
    1.0, 1.88821703, 5.09390954, 5.17675197
  ];

  static List<double> _applyRobustScaling(List<double> inputValues) {
    if (inputValues.length != _robustMedians.length) {
      throw Exception("Input length does not match number of features.");
    }

    return List.generate(inputValues.length, (i) {
      final iqr = _robustIQRs[i];
      return iqr == 0.0 ? 0.0 : (inputValues[i] - _robustMedians[i]) / iqr;
    });
  }

  static Future<int> predict(DiabetesInputModel input) async {
    final interpreter = await Interpreter.fromAsset('assets/models/modeld.tflite');

    final rawInput = input.toList(); // List<double> panjang 39
    final scaledInput = _applyRobustScaling(rawInput);
    final inputTensor = [scaledInput];

    final output = List.filled(1 * 1, 0).reshape([1, 1]);
    interpreter.run(inputTensor, output);

    final prediction = output[0][0];
    print("Prediction value: $prediction");

    return prediction > 0.5 ? 1 : 0;
  }
}
