import 'package:flutter/material.dart';
import 'package:Madhumeha/widgets/inputBox.dart';

class InputScreen extends StatelessWidget {
  final TextEditingController nameController = TextEditingController(); //membuat controller manggil TextEditingController dari inputBox.dart
  InputScreen({super.key}); // Tambahkan super.key untuk StatelessWidget //jadi kalau di scroll dia tidak berubah


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
  ],),),
    );
  }

}
