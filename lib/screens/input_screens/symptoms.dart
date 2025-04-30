import 'package:Madhumeha/screens/input_screens/lifeQuality.dart';
import 'package:Madhumeha/screens/input_screens/medicalHistory.dart';
import 'package:Madhumeha/widgets/primaryButton.dart';
import 'package:flutter/material.dart';
import 'package:Madhumeha/widgets/inputSlider.dart';
import 'package:Madhumeha/models/diabetesInput.dart';

class Symptoms extends StatefulWidget {
  final DiabetesInputModel diabetesInput; //karena dijadikan parameter, perlu diinisialisasi deluan
  Symptoms({super.key, required this.diabetesInput}); //seketika class ini jadi perlu parameter, ini disebut constructor
  @override
  State<Symptoms> createState() => _SymptomsState();
}

class _SymptomsState extends State<Symptoms> {
  bool frequentUrination = false;
  bool excessiveThirst = false;
  bool blurredVision = false;
  bool slowHealingSores = false;
  bool tinglingHandsFeet = false;
  bool unexplainedWeightLoss = false;

  void _frequentUrination(bool value) {
    setState(() {
      frequentUrination = value;
      widget.diabetesInput.frequentUrination = value ? 1 : 0; //pakai widget karena ini di dalam class state bukan kelas utama seperti personalInformation
    });
  }

  void _excessiveThirst(bool value) {
    setState(() {
      excessiveThirst = value;
      widget.diabetesInput.excessiveThirst = value ? 1 : 0;
    });
  }
  void _blurredVision(bool value) {
    setState(() {
      blurredVision = value;
      widget.diabetesInput.blurredVision = value ? 1 : 0;
    });
  }
  void _slowHealingSores(bool value) {
    setState(() {
      slowHealingSores = value;
      widget.diabetesInput.slowHealingSores = value ? 1 : 0;
    });
  }
  void _tinglingHandsFeet(bool value) {
    setState(() {
      tinglingHandsFeet = value;
      widget.diabetesInput.tinglingHandsFeet = value ? 1 : 0;
    });
  }
  void _unexplainedWeightLoss(bool value) {
    setState(() {
      unexplainedWeightLoss = value;
      widget.diabetesInput.unexplainedWeightLoss = value ? 1 : 0;
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
                      'Symptoms',
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
                  SizedBox(
                    child: Text(
                      'Frequent Urination',
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
                          isSelected: frequentUrination,
                          color: frequentUrination
                              ? Theme.of(context).primaryColor
                              : Theme.of(context).primaryColorDark,
                          textColor: frequentUrination
                              ? Theme.of(context).scaffoldBackgroundColor
                              : Theme.of(context).textTheme.bodySmall!.color!,
                          onPressed: () => _frequentUrination(true))),
                      SizedBox(width: 8),
                      Expanded(child: PrimaryButton(
                          label: 'False',
                          isToggle: true,
                          isSelected: !frequentUrination,
                          color: frequentUrination
                              ? Theme.of(context).primaryColor
                              : Theme.of(context).primaryColorDark,
                          width: double.infinity,
                          textColor: frequentUrination
                              ? Theme.of(context).scaffoldBackgroundColor
                              : Theme.of(context).textTheme.bodySmall!.color!,
                          onPressed: () => _frequentUrination(false))),
                    ],
                  ),// toggle
                  SizedBox(height: 20),
                  SizedBox(
                    child: Text(
                      'Excessive Thirst',
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
                          isSelected: excessiveThirst,
                          color: excessiveThirst
                              ? Theme.of(context).primaryColor
                              : Theme.of(context).primaryColorDark,
                          textColor: excessiveThirst
                              ? Theme.of(context).scaffoldBackgroundColor
                              : Theme.of(context).textTheme.bodySmall!.color!,
                          onPressed: () => _excessiveThirst(true))),
                      SizedBox(width: 8),
                      Expanded(child: PrimaryButton(
                          label: 'False',
                          isToggle: true,
                          isSelected: !excessiveThirst,
                          color: excessiveThirst
                              ? Theme.of(context).primaryColor
                              : Theme.of(context).primaryColorDark,
                          width: double.infinity,
                          textColor: excessiveThirst
                              ? Theme.of(context).scaffoldBackgroundColor
                              : Theme.of(context).textTheme.bodySmall!.color!,
                          onPressed: () => _excessiveThirst(false))),
                    ],
                  ),
                  SizedBox(height: 20),
                  InputSlider(
                    label: 'Fatigue Level',
                    min: 0,
                    max: 10,
                    divisions: 20,
                    onChanged: (value) {
                      setState(() {
                        widget.diabetesInput.fatigueLevels = value; //langsung disimpan disini tanpa perlu state dulu dibuat diatasnya
                      });
                    },
                  ),
                  // toggle
                  SizedBox(height: 20),
                  SizedBox(
                    child: Text(
                      'Blurred Vision',
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
                          isSelected: blurredVision,
                          color: blurredVision
                              ? Theme.of(context).primaryColor
                              : Theme.of(context).primaryColorDark,
                          textColor: blurredVision
                              ? Theme.of(context).scaffoldBackgroundColor
                              : Theme.of(context).textTheme.bodySmall!.color!,
                          onPressed: () => _blurredVision(true))),
                      SizedBox(width: 8),
                      Expanded(child: PrimaryButton(
                          label: 'False',
                          isToggle: true,
                          isSelected: !blurredVision,
                          color: blurredVision
                              ? Theme.of(context).primaryColor
                              : Theme.of(context).primaryColorDark,
                          width: double.infinity,
                          textColor: blurredVision
                              ? Theme.of(context).scaffoldBackgroundColor
                              : Theme.of(context).textTheme.bodySmall!.color!,
                          onPressed: () => _blurredVision(false))),
                    ],
                  ),
                  // toggle
                  SizedBox(height: 20),
                  SizedBox(
                    child: Text(
                      'Slow Healing Sores',
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
                          isSelected: slowHealingSores,
                          color: slowHealingSores
                              ? Theme.of(context).primaryColor
                              : Theme.of(context).primaryColorDark,
                          textColor: slowHealingSores
                              ? Theme.of(context).scaffoldBackgroundColor
                              : Theme.of(context).textTheme.bodySmall!.color!,
                          onPressed: () => _slowHealingSores(true))),
                      SizedBox(width: 8),
                      Expanded(child: PrimaryButton(
                          label: 'False',
                          isToggle: true,
                          isSelected: !slowHealingSores,
                          color: slowHealingSores
                              ? Theme.of(context).primaryColor
                              : Theme.of(context).primaryColorDark,
                          width: double.infinity,
                          textColor: slowHealingSores
                              ? Theme.of(context).scaffoldBackgroundColor
                              : Theme.of(context).textTheme.bodySmall!.color!,
                          onPressed: () => _slowHealingSores(false))),
                    ],
                  ),
                  // toggle
                  SizedBox(height: 20),
                  SizedBox(
                    child: Text(
                      'Tingling Hands/Feet',
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
                          isSelected: tinglingHandsFeet,
                          color: tinglingHandsFeet
                              ? Theme.of(context).primaryColor
                              : Theme.of(context).primaryColorDark,
                          textColor: tinglingHandsFeet
                              ? Theme.of(context).scaffoldBackgroundColor
                              : Theme.of(context).textTheme.bodySmall!.color!,
                          onPressed: () => _tinglingHandsFeet(true))),
                      SizedBox(width: 8),
                      Expanded(child: PrimaryButton(
                          label: 'False',
                          isToggle: true,
                          isSelected: !tinglingHandsFeet,
                          color: tinglingHandsFeet
                              ? Theme.of(context).primaryColor
                              : Theme.of(context).primaryColorDark,
                          width: double.infinity,
                          textColor: tinglingHandsFeet
                              ? Theme.of(context).scaffoldBackgroundColor
                              : Theme.of(context).textTheme.bodySmall!.color!,
                          onPressed: () => _tinglingHandsFeet(false))),
                    ],
                  ),
                  // toggle
                  SizedBox(height: 20),
                  SizedBox(
                    child: Text(
                      'Unexplained Weight Loss',
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
                          isSelected: unexplainedWeightLoss,
                          color: unexplainedWeightLoss
                              ? Theme.of(context).primaryColor
                              : Theme.of(context).primaryColorDark,
                          textColor: unexplainedWeightLoss
                              ? Theme.of(context).scaffoldBackgroundColor
                              : Theme.of(context).textTheme.bodySmall!.color!,
                          onPressed: () => _unexplainedWeightLoss(true))),
                      SizedBox(width: 8),
                      Expanded(child: PrimaryButton(
                          label: 'False',
                          isToggle: true,
                          isSelected: !unexplainedWeightLoss,
                          color: unexplainedWeightLoss
                              ? Theme.of(context).primaryColor
                              : Theme.of(context).primaryColorDark,
                          width: double.infinity,
                          textColor: unexplainedWeightLoss
                              ? Theme.of(context).scaffoldBackgroundColor
                              : Theme.of(context).textTheme.bodySmall!.color!,
                          onPressed: () => _unexplainedWeightLoss(false))),
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