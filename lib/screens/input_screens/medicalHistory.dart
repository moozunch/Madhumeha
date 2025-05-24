import 'package:Madhumeha/screens/input_screens/lifeQuality.dart';
import 'package:Madhumeha/screens/input_screens/prescribedMedication.dart';
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
    super.initState();

    if (widget.diabetesInput.systolicBloodPressure == 0) {
      systolicBloodPressureController.text = '';
    } else {
      systolicBloodPressureController.text = widget.diabetesInput.systolicBloodPressure.toString();
    }

    if (widget.diabetesInput.diastolicBloodPressure == 0) {
      diastolicBloodPressureController.text = '';
    } else {
      diastolicBloodPressureController.text = widget.diabetesInput.diastolicBloodPressure.toString();
    }

    if (widget.diabetesInput.fastingBloodSugar == 0.0) {
      fastingBloodSugarController.text = '';
    } else {
      fastingBloodSugarController.text = widget.diabetesInput.fastingBloodSugar.toString();
    }

    if (widget.diabetesInput.hbA1c == 0.0) {
      hbA1cController.text = '';
    } else {
      hbA1cController.text = widget.diabetesInput.hbA1c.toString();
    }

    if (widget.diabetesInput.serumCreatinine == 0.0) {
      serumCreatinineController.text = '';
    } else {
      serumCreatinineController.text = widget.diabetesInput.serumCreatinine.toString();
    }

    if (widget.diabetesInput.bunLevels == 0.0) {
      bunLevelsController.text = '';
    } else {
      bunLevelsController.text = widget.diabetesInput.bunLevels.toString();
    }

    if (widget.diabetesInput.cholesterolTotal == 0.0) {
      cholesterolTotalController.text = '';
    } else {
      cholesterolTotalController.text = widget.diabetesInput.cholesterolTotal.toString();
    }

    if (widget.diabetesInput.cholesterolLDL == 0.0) {
      cholesterolLDLController.text = '';
    } else {
      cholesterolLDLController.text = widget.diabetesInput.cholesterolLDL.toString();
    }

    if (widget.diabetesInput.cholesterolHDL == 0.0) {
      cholesterolHDLController.text = '';
    } else {
      cholesterolHDLController.text = widget.diabetesInput.cholesterolHDL.toString();
    }

    if (widget.diabetesInput.cholesterolTriglycerides == 0.0) {
      cholesterolTriglyceridesController.text = '';
    } else {
      cholesterolTriglyceridesController.text = widget.diabetesInput.cholesterolTriglycerides.toString();
    }



    systolicBloodPressureController.addListener(() {
      final value = int.tryParse(systolicBloodPressureController.text);
      if (value != null) {
        widget.diabetesInput.systolicBloodPressure = value;
      }
    });

    diastolicBloodPressureController.addListener(() {
      final value = int.tryParse(diastolicBloodPressureController.text);
      if (value != null) {
        widget.diabetesInput.diastolicBloodPressure = value;
      }
    });

    fastingBloodSugarController.addListener(() {
      final value = double.tryParse(fastingBloodSugarController.text);
      if (value != null) {
        widget.diabetesInput.fastingBloodSugar = value;
      }
    });

    hbA1cController.addListener(() {
      final value = double.tryParse(hbA1cController.text);
      if (value != null) {
        widget.diabetesInput.hbA1c = value;
      }
    });

    serumCreatinineController.addListener(() {
      final value = double.tryParse(serumCreatinineController.text);
      if (value != null) {
        widget.diabetesInput.serumCreatinine = value;
      }
    });

    bunLevelsController.addListener(() {
      final value = double.tryParse(bunLevelsController.text);
      if (value != null) {
        widget.diabetesInput.bunLevels = value;
      }
    });

    cholesterolTotalController.addListener(() {
      final value = double.tryParse(cholesterolTotalController.text);
      if (value != null) {
        widget.diabetesInput.cholesterolTotal = value;
      }
    });

    cholesterolLDLController.addListener(() {
      final value = double.tryParse(cholesterolLDLController.text);
      if (value != null) {
        widget.diabetesInput.cholesterolLDL = value;
      }
    });

    cholesterolHDLController.addListener(() {
      final value = double.tryParse(cholesterolHDLController.text);
      if (value != null) {
        widget.diabetesInput.cholesterolHDL = value;
      }
    });

    cholesterolTriglyceridesController.addListener(() {
      final value = double.tryParse(cholesterolTriglyceridesController.text);
      if (value != null) {
        widget.diabetesInput.cholesterolTriglycerides = value;
      }
    });
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
                    isNumber: true,
                    keyboardType: TextInputType.numberWithOptions(decimal: false), // for integers only
                    hint: 'mmHg',
                  ),
                  SizedBox(height: 20),
                  InputBox(
                    label: 'Diastolic Blood Pressure',
                    controller: diastolicBloodPressureController,
                    isNumber: true,
                    keyboardType: TextInputType.numberWithOptions(decimal: false), // for integers only
                    hint: 'mmHg',
                  ),
                  SizedBox(height: 20),
                  InputBox(
                    label: 'Fasting Blood Sugar',
                    controller: fastingBloodSugarController,
                    isNumber: true,
                    keyboardType: TextInputType.numberWithOptions(decimal: true),
                    hint: 'mg/dL',
                  ),
                  SizedBox(height: 20),
                  InputBox(
                    label: 'HbA1c',
                    controller: hbA1cController,
                    isNumber: true,
                    keyboardType: TextInputType.numberWithOptions(decimal: true), // for integers only
                    hint: '%',
                  ),
                  SizedBox(height: 20),
                  InputBox(
                    label: 'Serum Creatinine',
                    controller: serumCreatinineController,
                    isNumber: true,
                    keyboardType: TextInputType.numberWithOptions(decimal: true), // for integers only
                    hint: 'mg/dL',
                  ),
                  SizedBox(height: 20),
                  InputBox(
                    label: 'Bun Levels',
                    controller: bunLevelsController,
                    isNumber: true,
                    keyboardType: TextInputType.numberWithOptions(decimal: true), // for integers only
                    hint: 'mg/dL',
                  ),
                  SizedBox(height: 20),
                  InputBox(
                    label: 'Cholesterol Total',
                    controller: cholesterolTotalController,
                    isNumber: true,
                    keyboardType: TextInputType.numberWithOptions(decimal: true), // for integers only
                    hint: 'mg/dl',
                  ),
                  SizedBox(height: 20),
                  InputBox(
                    label: 'Cholesterol LDL',
                    controller: cholesterolLDLController,
                    isNumber: true,
                    keyboardType: TextInputType.numberWithOptions(decimal: true), // for integers only
                    hint: 'mg/dl',
                  ),
                  SizedBox(height: 20),
                  InputBox(
                    label: 'Cholesterol HDL',
                    controller: cholesterolHDLController,
                    isNumber: true,
                    keyboardType: TextInputType.numberWithOptions(decimal: true), // for integers only
                    hint: 'mg/dl',
                  ),
                  SizedBox(height: 20),
                  InputBox(
                    label: 'Cholesterol Triglycerides',
                    controller: cholesterolTriglyceridesController,
                    isNumber: true,
                    keyboardType: TextInputType.numberWithOptions(decimal: true), // for integers only
                    hint: 'mg/dl',
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
                                      MaterialPageRoute(builder: (context) => PrescribedMedication(diabetesInput: widget.diabetesInput)));
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