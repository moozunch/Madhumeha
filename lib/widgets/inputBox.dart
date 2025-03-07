import 'package:flutter/material.dart';


class InputBox extends StatelessWidget {
  final String label;
  final TextEditingController controller; //perlu buat controller variabel tipe data TextEditingController
  final String hint;
  final TextInputType keyboardType; //menampung tipe data keyboard


  //constructor
  const InputBox({
    super.key,
    required this.label,
    required this.controller,
    this.hint = '',
    this.keyboardType = TextInputType.text,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start, //menentukan posisi textfield
      children: [
        Text(label, style: Theme.of(context).textTheme.bodyMedium), //menampilkan label
        const SizedBox(height: 8,),
        TextField(
          controller: controller,
          keyboardType: keyboardType,
          decoration: InputDecoration(
            hintText: hint,
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
            contentPadding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
          ),
        ),
        const SizedBox(height: 16,), //jarak antar textfield ke2 nanti.
      ],
    );
  }
}