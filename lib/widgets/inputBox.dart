import 'package:flutter/material.dart';

class InputBox extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final String hint;
  final TextInputType keyboardType;
  final bool isDatePicker;
  final VoidCallback? onTap; // untuk trigger DatePicker atau NumberPicker

  const InputBox({
    Key? key,
    required this.label,
    required this.controller,
    this.hint = '',
    this.isDatePicker = false,
    this.keyboardType = TextInputType.text,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 8),
        ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 400),
          child: TextField(
            controller: controller,
            keyboardType: keyboardType,
            cursorColor: Theme.of(context).primaryColor,
            style: TextStyle(color: Theme.of(context).secondaryHeaderColor),
            readOnly: isDatePicker, // Mencegah keyboard muncul
            onTap: isDatePicker ? onTap : null, // Panggil onTap jika DatePicker
            decoration: InputDecoration(
              hintText: hint,
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
              contentPadding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Theme.of(context).primaryColor),
                borderRadius: BorderRadius.circular(8),
              ),
              suffixIcon: isDatePicker
                  ? Icon(Icons.calendar_today, color: Theme.of(context).primaryColor)
                  : null, // Ikon hanya jika DatePicker
            ),
          ),
        ),
        const SizedBox(height: 16),
      ],
    );
  }
}
