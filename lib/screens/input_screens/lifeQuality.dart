import 'package:Madhumeha/screens/input_screens/medicalRecords.dart';
import 'package:Madhumeha/widgets/primaryButton.dart';
import 'package:flutter/material.dart';
import 'package:Madhumeha/widgets/inputSlider.dart';
import 'package:Madhumeha/models/diabetesInput.dart';

class LifeQuality extends StatefulWidget {
  final DiabetesInputModel diabetesInput; //karena dijadikan parameter, perlu diinisialisasi deluan
  LifeQuality({super.key, required this.diabetesInput}); //seketika class ini jadi perlu parameter, ini disebut constructor
  @override
  State<LifeQuality> createState() => _LifeQualityState();
}

class _LifeQualityState extends State<LifeQuality> {
  bool heavyMetalExposure = false;
  bool occupationalExposureChemicals = false;
  bool waterQuality = false;


  void _heavyMetalExposure(bool value) {
    setState(() {
      heavyMetalExposure = value;
      widget.diabetesInput.heavyMetalsExposure = value ? 1: 0; //pakai widget karena ini di dalam class state bukan kelas utama seperti personalInformation
    });
  }

  void _occupationalExposureChemicals(bool value) {
    setState(() {
      occupationalExposureChemicals = value;
      widget.diabetesInput.occupationalExposureChemicals = value ? 1: 0;
    });
  }
  void _waterQuality(bool value) {
    setState(() {
      waterQuality = value;
      widget.diabetesInput.waterQuality = value ? 1: 0;
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
                      'Life Quality and Environment',
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
                  InputSlider(
                    label: 'Quality of Life Score',
                    min: 0,
                    max: 100,
                    divisions: 200,
                    unit: "Score",
                    onChanged: (value) {
                      setState(() {
                        widget.diabetesInput.qualityOfLifeScore = value; //langsung disimpan disini tanpa perlu state dulu dibuat diatasnya
                      });
                    },
                  ),
                  // toggle
                  SizedBox(height: 20),
                  SizedBox(
                    child: Text(
                      'Heavy Metal Exposure',
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
                          isSelected: heavyMetalExposure,
                          color: heavyMetalExposure
                              ? Theme.of(context).primaryColor
                              : Theme.of(context).primaryColorDark,
                          textColor: heavyMetalExposure
                              ? Theme.of(context).scaffoldBackgroundColor
                              : Theme.of(context).textTheme.bodySmall!.color!,
                          onPressed: () => _heavyMetalExposure(true))),
                      SizedBox(width: 8),
                      Expanded(child: PrimaryButton(
                          label: 'False',
                          isToggle: true,
                          isSelected: !heavyMetalExposure,
                          color: heavyMetalExposure
                              ? Theme.of(context).primaryColor
                              : Theme.of(context).primaryColorDark,
                          width: double.infinity,
                          textColor: heavyMetalExposure
                              ? Theme.of(context).scaffoldBackgroundColor
                              : Theme.of(context).textTheme.bodySmall!.color!,
                          onPressed: () => _heavyMetalExposure(false))),
                    ],
                  ),
                  // toggle
                  SizedBox(height: 20),
                  SizedBox(
                    child: Text(
                      'Occupational Exposure to Chemicals',
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
                          isSelected: occupationalExposureChemicals,
                          color: occupationalExposureChemicals
                              ? Theme.of(context).primaryColor
                              : Theme.of(context).primaryColorDark,
                          textColor: occupationalExposureChemicals
                              ? Theme.of(context).scaffoldBackgroundColor
                              : Theme.of(context).textTheme.bodySmall!.color!,
                          onPressed: () => _occupationalExposureChemicals(true))),
                      SizedBox(width: 8),
                      Expanded(child: PrimaryButton(
                          label: 'False',
                          isToggle: true,
                          isSelected: !occupationalExposureChemicals,
                          color: occupationalExposureChemicals
                              ? Theme.of(context).primaryColor
                              : Theme.of(context).primaryColorDark,
                          width: double.infinity,
                          textColor: occupationalExposureChemicals
                              ? Theme.of(context).scaffoldBackgroundColor
                              : Theme.of(context).textTheme.bodySmall!.color!,
                          onPressed: () => _occupationalExposureChemicals(false))),
                    ],
                  ),
                  // toggle
                  SizedBox(height: 20),
                  SizedBox(
                    child: Text(
                      'Water Quality',
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
                          label: 'Poor',
                          isToggle: true,
                          isSelected: waterQuality,
                          color: waterQuality
                              ? Theme.of(context).primaryColor
                              : Theme.of(context).primaryColorDark,
                          textColor: waterQuality
                              ? Theme.of(context).scaffoldBackgroundColor
                              : Theme.of(context).textTheme.bodySmall!.color!,
                          onPressed: () => _waterQuality(true))),
                      SizedBox(width: 8),
                      Expanded(child: PrimaryButton(
                          label: 'Good',
                          isToggle: true,
                          isSelected: !waterQuality,
                          color: waterQuality
                              ? Theme.of(context).primaryColor
                              : Theme.of(context).primaryColorDark,
                          width: double.infinity,
                          textColor: waterQuality
                              ? Theme.of(context).scaffoldBackgroundColor
                              : Theme.of(context).textTheme.bodySmall!.color!,
                          onPressed: () => _waterQuality(false))),
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
                                label: 'Next',
                                color: Theme.of(context).primaryColor,
                                textColor: Theme.of(context).scaffoldBackgroundColor,
                                width: 180,
                                onPressed: () {
                                  Navigator.push(context,
                                      MaterialPageRoute(builder: (context) => MedicalRecords(diabetesInput: widget.diabetesInput)));
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