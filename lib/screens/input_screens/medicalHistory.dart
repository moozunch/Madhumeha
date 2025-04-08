import 'package:Madhumeha/screens/input_screens/lifeQuality.dart';
import 'package:Madhumeha/widgets/primaryButton.dart';
import 'package:flutter/material.dart';
import 'package:Madhumeha/widgets/inputSlider.dart';
import 'package:Madhumeha/models/diabetesInput.dart';

import '../../widgets/inputBox.dart';

class MedicalHistory extends StatefulWidget {
  final DiabetesInputModel diabetesInput; //karena dijadikan parameter, perlu diinisialisasi deluan
  MedicalHistory({super.key, required this.diabetesInput}); //seketika class ini jadi perlu parameter, ini disebut constructor
  @override
  State<MedicalHistory> createState() => _MedicalHistoryState();
}

class _MedicalHistoryState extends State<MedicalHistory> {
  bool previousPreDiabetes = false;
  bool hypertension = false;

  final TextEditingController systolicBloodPressureController = TextEditingController();
  final TextEditingController diastolicBloodPressureController = TextEditingController();
  final TextEditingController fastingBloodSugarController = TextEditingController();
  final TextEditingController hbA1cController = TextEditingController();
  final TextEditingController serumCreatinineController = TextEditingController();
  final TextEditingController bunLevelsController = TextEditingController();
  final TextEditingController cholesterolTotalController = TextEditingController();
  final TextEditingController cholesterolLDLController = TextEditingController();
  final TextEditingController cholesterolHDLController = TextEditingController();
  final TextEditingController cholesterolTriglyceridesController = TextEditingController();


  @override
  void initState() {
    systolicBloodPressureController.text = widget.diabetesInput.systolicBloodPressure.toString();
    diastolicBloodPressureController.text = widget.diabetesInput.diastolicBloodPressure.toString();
    fastingBloodSugarController.text = widget.diabetesInput.fastingBloodSugar.toString();
    hbA1cController.text = widget.diabetesInput.hbA1c.toString();
    serumCreatinineController.text = widget.diabetesInput.serumCreatinine.toString();
    bunLevelsController.text = widget.diabetesInput.bunLevels.toString();
    cholesterolTotalController.text = widget.diabetesInput.cholesterolTotal.toString();
    cholesterolLDLController.text = widget.diabetesInput.cholesterolLDL.toString();
    cholesterolHDLController.text = widget.diabetesInput.cholesterolHDL.toString();
    cholesterolTriglyceridesController.text = widget.diabetesInput.cholesterolTriglycerides.toString();
  }

  void _previousPreDiabetes(bool value) {
    setState(() {
      previousPreDiabetes = value;
      widget.diabetesInput.previousPreDiabetes = value ? 1 : 0; //pakai widget karena ini di dalam class state bukan kelas utama seperti personalInformation
    });
  }

  void _hypertension(bool value) {
    setState(() {
      hypertension = value;
      widget.diabetesInput.hypertension = value ? 1 : 0;
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
                      'Medical History',
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
                  // toggle
                  SizedBox(
                    child: Text(
                      'Previous Pre-Diabetes',
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
                          isSelected: previousPreDiabetes,
                          color: previousPreDiabetes
                              ? Theme.of(context).primaryColor
                              : Theme.of(context).primaryColorDark,
                          textColor: previousPreDiabetes
                              ? Theme.of(context).scaffoldBackgroundColor
                              : Theme.of(context).textTheme.bodySmall!.color!,
                          onPressed: () => _previousPreDiabetes(true))),
                      SizedBox(width: 8),
                      Expanded(child: PrimaryButton(
                          label: 'False',
                          isToggle: true,
                          isSelected: !previousPreDiabetes,
                          color: previousPreDiabetes
                              ? Theme.of(context).primaryColor
                              : Theme.of(context).primaryColorDark,
                          width: double.infinity,
                          textColor: previousPreDiabetes
                              ? Theme.of(context).scaffoldBackgroundColor
                              : Theme.of(context).textTheme.bodySmall!.color!,
                          onPressed: () => _previousPreDiabetes(false))),
                    ],
                  ),// toggle
                  SizedBox(height: 20),
                  SizedBox(
                    child: Text(
                      'Hypertension',
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
                          isSelected: hypertension,
                          color: hypertension
                              ? Theme.of(context).primaryColor
                              : Theme.of(context).primaryColorDark,
                          textColor: hypertension
                              ? Theme.of(context).scaffoldBackgroundColor
                              : Theme.of(context).textTheme.bodySmall!.color!,
                          onPressed: () => _hypertension(true))),
                      SizedBox(width: 8),
                      Expanded(child: PrimaryButton(
                          label: 'False',
                          isToggle: true,
                          isSelected: !hypertension,
                          color: hypertension
                              ? Theme.of(context).primaryColor
                              : Theme.of(context).primaryColorDark,
                          width: double.infinity,
                          textColor: hypertension
                              ? Theme.of(context).scaffoldBackgroundColor
                              : Theme.of(context).textTheme.bodySmall!.color!,
                          onPressed: () => _hypertension(false))),
                    ],
                  ),
                  SizedBox(height: 20),
                  InputBox(
                    label: 'Systolic Blood Pressure',
                    controller: systolicBloodPressureController,
                    isNumberPicker: true,
                    min: 80,
                    max: 240,
                    hint: 'mmHg',
                    onNumberPicked: (value) {
                      systolicBloodPressureController.text = value.toString();
                      widget.diabetesInput.systolicBloodPressure = value.toInt();
                    },
                  ),
                  SizedBox(height: 20),
                  InputBox(
                    label: 'Diastolic Blood Pressure',
                    controller: diastolicBloodPressureController,
                    isNumberPicker: true,
                    min: 50,
                    max: 160,
                    hint: 'mmHg',
                    onNumberPicked: (value) {
                      diastolicBloodPressureController.text = value.toString();
                      widget.diabetesInput.diastolicBloodPressure = value.toInt();
                    },
                  ),
                  SizedBox(height: 20),
                  InputBox(
                    label: 'Fasting Blood Sugar',
                    controller: fastingBloodSugarController,
                    isNumberPicker: true,
                    min: 50,
                    max: 250,
                    hint: 'mg/dL',
                    onNumberPicked: (value) {
                      fastingBloodSugarController.text = value.toString();
                      widget.diabetesInput.fastingBloodSugar = value.toDouble();
                    },
                  ),
                  SizedBox(height: 20),
                  InputBox(
                    label: 'HbA1c',
                    controller: hbA1cController,
                    isNumberPicker: true,
                    min: 4.0,
                    max: 14.0,
                    hint: '%',
                    onNumberPicked: (value) {
                      hbA1cController.text = value.toString();
                      widget.diabetesInput.hbA1c = value.toDouble();
                    },
                  ),
                  SizedBox(height: 20),
                  InputBox(
                    label: 'Serum Creatinine',
                    controller: serumCreatinineController,
                    isNumberPicker: true,
                    min: 0.4,
                    max: 2.0,
                    hint: 'mg/dL',
                    onNumberPicked: (value) {
                      serumCreatinineController.text = value.toString();
                      widget.diabetesInput.serumCreatinine = value.toDouble();
                    },
                  ),
                  SizedBox(height: 20),
                  InputBox(
                    label: 'Bun Levels',
                    controller: bunLevelsController,
                    isNumberPicker: true,
                    min: 5,
                    max: 30,
                    hint: 'mg/dL',
                    onNumberPicked: (value) {
                      bunLevelsController.text = value.toString();
                      widget.diabetesInput.bunLevels = value.toDouble();
                    },
                  ),
                  SizedBox(height: 20),
                  InputBox(
                    label: 'Cholesterol Total',
                    controller: cholesterolTotalController,
                    isNumberPicker: true,
                    min: 100,
                    max: 300,
                    hint: 'mg/dL',
                    onNumberPicked: (value) {
                      cholesterolTotalController.text = value.toString();
                      widget.diabetesInput.cholesterolTotal = value.toDouble();
                    },
                  ),
                  SizedBox(height: 20),
                  InputBox(
                    label: 'Cholesterol LDL',
                    controller: cholesterolLDLController,
                    isNumberPicker: true,
                    min: 50,
                    max: 200,
                    hint: 'mg/dL',
                    onNumberPicked: (value) {
                      cholesterolLDLController.text = value.toString();
                      widget.diabetesInput.cholesterolLDL = value.toDouble();
                    },
                  ),
                  SizedBox(height: 20),
                  InputBox(
                    label: 'Cholesterol HDL',
                    controller: cholesterolHDLController,
                    isNumberPicker: true,
                    min: 20,
                    max: 100,
                    hint: 'mg/dL',
                    onNumberPicked: (value) {
                      cholesterolHDLController.text = value.toString();
                      widget.diabetesInput.cholesterolHDL = value.toDouble();
                    },
                  ),
                  SizedBox(height: 20),
                  InputBox(
                    label: 'Cholesterol Triglycerides',
                    controller: cholesterolTriglyceridesController,
                    isNumberPicker: true,
                    min: 50,
                    max: 300,
                    hint: 'mg/dL',
                    onNumberPicked: (value) {
                      cholesterolTriglyceridesController.text = value.toString();
                      widget.diabetesInput.cholesterolTriglycerides = value.toDouble();
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
                                      MaterialPageRoute(builder: (context) => MedicalHistory(diabetesInput: widget.diabetesInput)));
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