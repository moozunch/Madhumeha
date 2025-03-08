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
    required this.controller, //required karena controller wajib diisi
    this.hint = '', //without required because it's optional
    this.keyboardType = TextInputType.text,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start, //menentukan posisi textfield
      children: [
        Text(label, style: Theme.of(context).textTheme.bodyMedium), //menampilkan label
        const SizedBox(height: 8,),
        //input box textfield
        TextField(
          controller: controller,
          keyboardType: keyboardType,
          cursorColor: Theme.of(context).primaryColor,
          style: TextStyle(color: Theme.of(context).secondaryHeaderColor),
          decoration: InputDecoration(
            hintText: hint,
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
            contentPadding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Theme.of(context).primaryColor),
              borderRadius: BorderRadius.circular(8),
            )
          ),
        ),
        const SizedBox(height: 16,), //jarak antar textfield ke2 nanti.
      ],
    );
  }
}