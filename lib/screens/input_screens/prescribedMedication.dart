import 'package:Madhumeha/screens/input_screens/medicalRecords.dart';
import 'package:Madhumeha/widgets/primaryButton.dart';
import 'package:flutter/material.dart';
import 'package:Madhumeha/models/diabetesInput.dart';

import '../../services/predictor.dart';
import '../result_screens/resultsDiabetes.dart';

class PrescribedMedication extends StatefulWidget {
  final DiabetesInputModel diabetesInput; //karena dijadikan parameter, perlu diinisialisasi deluan
  PrescribedMedication({super.key, required this.diabetesInput}); //seketika class ini jadi perlu parameter, ini disebut constructor
  @override
  State<PrescribedMedication> createState() => _PrescribedMedicationState();
}

class _PrescribedMedicationState extends State<PrescribedMedication> {
  bool antiHypertensiveMedication = false;
  bool statins = false;
  bool antiDiabeticMedication = false;


  void _antiHypertensiveMedication(bool value) {
    setState(() {
      antiHypertensiveMedication = value;
      widget.diabetesInput.antihypertensiveMedications = value ? 1: 0; //pakai widget karena ini di dalam class state bukan kelas utama seperti personalInformation
    });
  }

  void _statins(bool value) {
    setState(() {
      statins = value;
      widget.diabetesInput.statins = value ? 1: 0;
    });
  }
  void _antiDiabeticMedication(bool value) {
    setState(() {
      antiDiabeticMedication = value;
      widget.diabetesInput.antidiabeticMedications = value ? 1: 0;
    });
  }

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
                  SizedBox(height: 40,),
                  SizedBox(
                    child: Text(
                      textAlign: TextAlign.start,
                      'Prescribed Medication',
                      style: Theme.of(context).textTheme.headlineLarge,
                    ),
                  ),
                  SizedBox(
                    child: Text(
                      textAlign: TextAlign.start,
                      'You can change this information later',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ),
                  SizedBox(height: 40),
                  SizedBox(
                    child: Text(
                      'Anti Hypertensive Medication',
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium
                          ?.copyWith(fontWeight: FontWeight.w600),
                    ),
                  ),
                  SizedBox(height: 8,),
                  Row(
                    children: [
                      Expanded(child: PrimaryButton(
                          label: 'True',
                          isToggle: true,
                          isSelected: antiHypertensiveMedication,
                          color: antiHypertensiveMedication
                              ? Theme.of(context).primaryColor
                              : Theme.of(context).primaryColorDark,
                          textColor: antiHypertensiveMedication
                              ? Theme.of(context).scaffoldBackgroundColor
                              : Theme.of(context).textTheme.bodySmall!.color!,
                          onPressed: () => _antiHypertensiveMedication(true))),
                      SizedBox(width: 8),
                      Expanded(child: PrimaryButton(
                          label: 'False',
                          isToggle: true,
                          isSelected: !antiHypertensiveMedication,
                          color: antiHypertensiveMedication
                              ? Theme.of(context).primaryColor
                              : Theme.of(context).primaryColorDark,
                          width: double.infinity,
                          textColor: antiHypertensiveMedication
                              ? Theme.of(context).scaffoldBackgroundColor
                              : Theme.of(context).textTheme.bodySmall!.color!,
                          onPressed: () => _antiHypertensiveMedication(false))),
                    ],
                  ),
                  // toggle
                  SizedBox(height: 20),
                  SizedBox(
                    child: Text(
                      'Statins',
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium
                          ?.copyWith(fontWeight: FontWeight.w600),
                    ),
                  ),
                  SizedBox(height: 8,),
                  Row(
                    children: [
                      Expanded(child: PrimaryButton(
                          label: 'True',
                          isToggle: true,
                          isSelected: statins,
                          color: statins
                              ? Theme.of(context).primaryColor
                              : Theme.of(context).primaryColorDark,
                          textColor: statins
                              ? Theme.of(context).scaffoldBackgroundColor
                              : Theme.of(context).textTheme.bodySmall!.color!,
                          onPressed: () => _statins(true))),
                      SizedBox(width: 8),
                      Expanded(child: PrimaryButton(
                          label: 'False',
                          isToggle: true,
                          isSelected: !statins,
                          color: statins
                              ? Theme.of(context).primaryColor
                              : Theme.of(context).primaryColorDark,
                          width: double.infinity,
                          textColor: statins
                              ? Theme.of(context).scaffoldBackgroundColor
                              : Theme.of(context).textTheme.bodySmall!.color!,
                          onPressed: () => _statins(false))),
                    ],
                  ),
                  // toggle
                  SizedBox(height: 20),
                  SizedBox(
                    child: Text(
                      'AntiDiabetic Medication',
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium
                          ?.copyWith(fontWeight: FontWeight.w600),
                    ),
                  ),
                  SizedBox(height: 8,),
                  Row(
                    children: [
                      Expanded(child: PrimaryButton(
                          label: 'True',
                          isToggle: true,
                          isSelected: antiDiabeticMedication,
                          color: antiDiabeticMedication
                              ? Theme.of(context).primaryColor
                              : Theme.of(context).primaryColorDark,
                          textColor: antiDiabeticMedication
                              ? Theme.of(context).scaffoldBackgroundColor
                              : Theme.of(context).textTheme.bodySmall!.color!,
                          onPressed: () => _antiDiabeticMedication(true))),
                      SizedBox(width: 8),
                      Expanded(child: PrimaryButton(
                          label: 'False',
                          isToggle: true,
                          isSelected: !antiDiabeticMedication,
                          color: antiDiabeticMedication
                              ? Theme.of(context).primaryColor
                              : Theme.of(context).primaryColorDark,
                          width: double.infinity,
                          textColor: antiDiabeticMedication
                              ? Theme.of(context).scaffoldBackgroundColor
                              : Theme.of(context).textTheme.bodySmall!.color!,
                          onPressed: () => _antiDiabeticMedication(false))),
                    ],
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
                            label: 'Predict',
                            color: Theme.of(context).primaryColor,
                            textColor: Theme.of(context).scaffoldBackgroundColor,
                            width: 180,
                            onPressed: () async {
                              try {
                                // Tampilkan loading
                                showDialog(
                                  context: context,
                                  barrierDismissible: false,
                                  builder: (_) => const Center(child: CircularProgressIndicator()),
                                );

                                // Panggil model prediksi
                                final result = await PredictorService.predict(widget.diabetesInput);

                                // Tutup loading
                                Navigator.of(context).pop();

                                // Navigasi langsung ke ResultsDiabetes
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => ResultsDiabetes(
                                      diabetesInput: widget.diabetesInput,
                                    ),
                                    settings: RouteSettings(arguments: result),
                                  ),
                                );
                              } catch (e) {
                                Navigator.of(context).pop(); // pastikan loading tertutup
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(content: Text('Prediction failed: $e')),
                                );
                              }
                            },
                          ),
                        ),

                      ]
                  )
                  //lanjutan disini
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}