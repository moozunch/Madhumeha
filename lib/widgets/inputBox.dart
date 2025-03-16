import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';

class InputBox extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final String hint;
  final TextInputType keyboardType;
  final bool isDatePicker;
  final bool isNumberPicker;
  final int? min;
  final int? max; //nggak yakin integer or not
  final Function(int)? onNumberPicked;
  final VoidCallback? onTap; // untuk trigger DatePicker atau NumberPicker

  const InputBox({
    Key? key,
    required this.label,
    required this.controller,
    this.hint = '',
    this.isDatePicker = false,
    this.isNumberPicker = false,
    this.min,
    this.max,
    this.onNumberPicked,
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
            readOnly: isDatePicker || isNumberPicker, // Mencegah keyboard muncul
            onTap: isDatePicker || isNumberPicker ? () => _showPicker(context) : onTap, // Panggil onTap jika DatePicker
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
                  : (isNumberPicker ? Icon(Icons.arrow_drop_down, color: Theme.of(context).primaryColor) : null), // Ikon hanya jika DatePicker atau numberPicker
            ),
          ),
        ),
        const SizedBox(height: 16),
      ],
    );
  }
  void _showPicker(BuildContext context) {
    if (isNumberPicker && min != null && max != null && onNumberPicked != null) {
      _showNumberPicker(context);
    }
  }

  //Menampilkan modal bottom sheet dengan NumberPicker
  void _showNumberPicker(BuildContext context) {
    int currentValue = int.tryParse(controller.text) ?? min!; // Jika tidak bisa di-parse, gunakan nilai minimum

    showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
            height: 250,
            padding: EdgeInsets.all(16), //edgeinsets.all untuk memberikan padding pada semua sisi
            child: Column(
              children: [
                Text(
                  "Pilih ${label.toLowerCase()}",
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w600),
                ),
                SizedBox(height: 16),
                NumberPicker(
                    minValue: min!,
                    maxValue: max!,
                    value: currentValue,
                    onChanged: (value) {
                      currentValue = value;
                    },
                ),
                ElevatedButton(
                  onPressed: () {
                    controller.text = currentValue.toString();
                    onNumberPicked!(currentValue);
                    Navigator.pop(context);
                  },
                  child: Text("OK"),
                )
              ],
            ),
          );
        }
    );
  }
}

