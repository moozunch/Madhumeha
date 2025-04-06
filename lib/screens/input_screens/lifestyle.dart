import 'package:Madhumeha/widgets/primaryButton.dart';
import 'package:flutter/material.dart';
import 'package:Madhumeha/widgets/inputBox.dart';
import 'package:Madhumeha/widgets/dropDown.dart';
import 'package:Madhumeha/widgets/inputSlider.dart';
import 'package:Madhumeha/models/diabetesInput.dart';

class Lifestyle extends StatefulWidget {
  final DiabetesInputModel diabetesInput; //karena dijadikan parameter, perlu diinisialisasi deluan
  Lifestyle({super.key, required this.diabetesInput}); //seketika class ini jadi perlu parameter, ini disebut constructor
  @override
  State<Lifestyle> createState() => _LifestyleState();
}

class _LifestyleState extends State<Lifestyle> {
  bool smoking = false;


  void _smoking(bool value) {
    setState(() {
      smoking = value;
      widget.diabetesInput.smoking = value ? 1: 0; //pakai widget karena ini di dalam class state bukan kelas utama seperti personalInformation
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
                      'Lifestyle',
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
                      'Smoking',
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
                          isSelected: smoking,
                          color: smoking
                              ? Theme.of(context).primaryColor
                              : Theme.of(context).primaryColorDark,
                          textColor: smoking
                              ? Theme.of(context).scaffoldBackgroundColor
                              : Theme.of(context).textTheme.bodySmall!.color!,
                          onPressed: () => _smoking(true))),
                      SizedBox(width: 8),
                      Expanded(child: PrimaryButton(
                          label: 'False',
                          isToggle: true,
                          isSelected: !smoking,
                          color: smoking
                              ? Theme.of(context).primaryColor
                              : Theme.of(context).primaryColorDark,
                          width: double.infinity,
                          textColor: smoking
                              ? Theme.of(context).scaffoldBackgroundColor
                              : Theme.of(context).textTheme.bodySmall!.color!,
                          onPressed: () => _smoking(false))),
                    ],
                  ),
                  SizedBox(height: 20),
                  InputSlider(
                    label: 'Alcohol Consumption',
                    min: 0,
                    max: 10,
                    divisions: 10,
                    unit: 'glass/week', //?masih harus dipastikan
                    onChanged: (value) {
                      setState(() {
                        widget.diabetesInput.alcoholConsumption = value; //langsung disimpan disini tanpa perlu state dulu dibuat diatasnya
                      });
                    },
                  ),
                  SizedBox(height: 20),
                  InputSlider(
                    label: 'Diet Quality',
                    min: 0,
                    max: 10,
                    divisions: 10,
                     // Unit ?masih harus dipastikan
                    onChanged: (value) {
                      setState(() {
                        widget.diabetesInput.dietQuality = value; //langsung disimpan disini tanpa perlu state dulu dibuat diatasnya
                      });
                    },
                  ),
                  SizedBox(height: 20),
                  InputSlider(
                    label: 'Sleep Quality',
                    min: 0,
                    max: 10,
                    divisions: 10,
                    //unit ?masih harus dipastikan
                    onChanged: (value) {
                      setState(() {
                        widget.diabetesInput.sleepQuality = value; //langsung disimpan disini tanpa perlu state dulu dibuat diatasnya
                      });
                    },
                  ),
                  SizedBox(height: 20),
                  InputSlider(
                    label: 'Physical Activity',
                    min: 0,
                    max: 10,
                    divisions: 10,
                    // Unit ?masih harus dipastikan
                    onChanged: (value) {
                      setState(() {
                        widget.diabetesInput.physicalActivity = value; //langsung disimpan disini tanpa perlu state dulu dibuat diatasnya
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
                                  // Navigator.push(context,
                                  //     MaterialPageRoute(builder: (context) => Lifestyle(diabetesInput: widget.diabetesInput)));
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