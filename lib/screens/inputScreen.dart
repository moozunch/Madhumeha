import 'package:flutter/material.dart';
import 'package:Madhumeha/widgets/inputBox.dart';
import 'package:Madhumeha/widgets/inputSlider.dart';
import 'package:Madhumeha/widgets/dropDown.dart';

class InputScreen extends StatefulWidget {
  InputScreen(
      {super.key}); // Tambahkan super.key untuk StatelessWidget //jadi kalau di scroll dia tidak berubah
  @override
  State<StatefulWidget> createState() => _InputScreenState();
}

class _InputScreenState extends State<InputScreen> {
  //Input Box
  TextEditingController nameController = TextEditingController(); //membuat controller manggil TextEditingController dari inputBox.dart

  //Slider
  double alchoholConsumption = 0.0;

  //Dropdown
  String? selectedGender;

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
          onChanged: (value) {
            alchoholConsumption = value;
          },
        ),
        const SizedBox(height: 20,),
        DropDown(
          label: 'Gender',
          items: ['Male', 'Female'],
          initialValue: 'Gender',
          onChanged: (value){
            setState(() {
              selectedGender = value;
            });
          },
        ),
  ],),),
    );
  }

}
