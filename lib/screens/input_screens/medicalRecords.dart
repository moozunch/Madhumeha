import 'package:Madhumeha/screens/input_screens/lifeQuality.dart';
import 'package:Madhumeha/screens/input_screens/symptoms.dart';
import 'package:Madhumeha/widgets/primaryButton.dart';
import 'package:flutter/material.dart';
import 'package:Madhumeha/widgets/inputSlider.dart';
import 'package:Madhumeha/models/diabetesInput.dart';

class MedicalRecords extends StatefulWidget {
  final DiabetesInputModel diabetesInput; //karena dijadikan parameter, perlu diinisialisasi deluan
  MedicalRecords({super.key, required this.diabetesInput}); //seketika class ini jadi perlu parameter, ini disebut constructor
  @override
  State<MedicalRecords> createState() => _MedicalRecordsState();
}

class _MedicalRecordsState extends State<MedicalRecords> {

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
                      'Medical Records',
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
                  SizedBox(height: 40,),
                  InputSlider(
                    label: 'Medical Checkup Frequency',
                    min: 0,
                    max: 4,
                    divisions: 4,
                    unit: 'times/year',
                    onChanged: (value) {
                      setState(() {
                        widget.diabetesInput.medicalCheckupsFrequency = value; //langsung disimpan disini tanpa perlu state dulu dibuat diatasnya
                      });
                    },
                  ),
                  SizedBox(height: 20),
                  InputSlider(
                    label: 'Medication Adherence',
                    min: 0,
                    max: 10,
                    divisions: 20,
                    unit: "Score",
                    onChanged: (value) {
                      setState(() {
                        widget.diabetesInput.medicationAdherence = value; //langsung disimpan disini tanpa perlu state dulu dibuat diatasnya
                      });
                    },
                  ),
                  SizedBox(height: 20),
                  InputSlider(
                    label: 'Health Literacy',
                    min: 0,
                    max: 10,
                    divisions: 20,
                    unit: "Score",
                    onChanged: (value) {
                      setState(() {
                        widget.diabetesInput.healthLiteracy = value; //langsung disimpan disini tanpa perlu state dulu dibuat diatasnya
                      });
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
                                      MaterialPageRoute(builder: (context) => Symptoms(diabetesInput: widget.diabetesInput)));
                                })
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