import 'package:Madhumeha/screens/input_screens/lifeQuality.dart';
import 'package:Madhumeha/widgets/primaryButton.dart';
import 'package:flutter/material.dart';
import 'package:Madhumeha/widgets/inputSlider.dart';
import 'package:Madhumeha/models/diabetesInput.dart';

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
  final TextEditingController fastingBloodSugar = TextEditingController();
  final TextEditingController hbA1c = TextEditingController();
  final TextEditingController serumCreatinine = TextEditingController();
  final TextEditingController bunLevels = TextEditingController();
  final TextEditingController cholesterolTotal = TextEditingController();
  final TextEditingController cholesterolldl = TextEditingController();
  final TextEditingController cholesterolhdl = TextEditingController();
  final TextEditingController cholesteroltriglycerides = TextEditingController();


  @override
  void initState() {
    systolicBloodPressureController.text = widget.diabetesInput.systolicBloodPressure.toString();
    diastolicBloodPressureController.text = widget.diabetesInput.diastolicBloodPressure.toString();
    fastingBloodSugar.text = widget.diabetesInput.fastingBloodSugar.toString();
    hbA1c.text = widget.diabetesInput.hbA1c.toString();
    serumCreatinine.text = widget.diabetesInput.serumCreatinine.toString();
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
                    label: 'Weight',
                    controller: weightController,
                    isNumberPicker: true,
                    min: 0,
                    max: 500,
                    hint: 'kg',
                    onNumberPicked: (value) {
                      weightController.text = value.toString();
                      widget.diabetesInput.weight = value.toDouble();
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
                      widget.diabetesInput.weight = value.toDouble();
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
                      widget.diabetesInput.weight = value.toDouble();
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
                      widget.diabetesInput.weight = value.toDouble();
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
                      widget.diabetesInput.weight = value.toDouble();
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
                      widget.diabetesInput.weight = value.toDouble();
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
                      widget.diabetesInput.weight = value.toDouble();
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
                      widget.diabetesInput.weight = value.toDouble();
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
                      widget.diabetesInput.weight = value.toDouble();
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