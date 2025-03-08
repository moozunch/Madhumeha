import 'package:flutter/material.dart';
import 'package:Madhumeha/widgets/inputBox.dart';
import 'package:Madhumeha/widgets/inputSlider.dart';

class InputScreen extends StatelessWidget {
  InputScreen({super.key}); // Tambahkan super.key untuk StatelessWidget //jadi kalau di scroll dia tidak berubah

  //Input Box
  final TextEditingController nameController = TextEditingController(); //membuat controller manggil TextEditingController dari inputBox.dart

  //Slider
  double AlcoholConsumption = 0.0;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
    body: Padding(
    padding: const EdgeInsets.all(16.0),
    child: Column(
      children: [
        InputBox( //menggunakan widget InputBox
          label: 'Name',
          controller: nameController,
          hint: 'Enter your name',
          keyboardType: TextInputType.text,
        ),
        const SizedBox(height: 20,),
        InputSlider(
            label: 'Alcohol Consumption',
            min: 0.0,
            max: 10.0,
            divisions: 10,
            unit: 'glasses',
            onChanged: (value){
              AlcoholConsumption = value;
            },
        ),
  ],),),
    );
  }

}
