import 'package:flutter/material.dart';

//Bisa untuk input string, sebagai datepicker, numberpicker.

class InputBox extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final String hint;
  final TextInputType keyboardType;
  final VoidCallback? onTap; // untuk trigger DatePicker atau NumberPicker

  // Constructor
  const InputBox({
    super.key,
    required this.label,
    required this.controller,
    this.hint = '',
    this.keyboardType = TextInputType.text,
    this.onTap
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: Theme.of(context).textTheme.bodyMedium),
        const SizedBox(height: 8,),
        GestureDetector(
          onTap: onTap,
          child: AbsorbPointer(
            // agar input box tidak langsung aktifin keyboard
            child: ConstrainedBox(
              constraints: const BoxConstraints(
                maxWidth: 300,
              ),
              child: TextField(
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
                  ),
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 16,),
      ],
    );
  }
}