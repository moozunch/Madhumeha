import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:numberpicker/numberpicker.dart';

class InputBox extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final String hint;
  final TextInputType keyboardType;
  final bool isDatePicker;
  final bool isNumberPicker;
  final num? min;
  final num? max; //nggak yakin integer or double
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
            onTap: isDatePicker || isNumberPicker ? () => _showPicker(context) : onTap,
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
    } else if (isDatePicker) {
      _showDatePicker(context);
    }
  }



  //Menampilkan modal bottom sheet dengan NumberPicker
  void _showNumberPicker(BuildContext context) {
    num currentValue = int.tryParse(controller.text) ?? min!;

    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          alignment: Alignment.center, // Buat di tengah
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text("Your $label", style: Theme.of(context).textTheme.titleMedium),
                const SizedBox(height: 12),
                StatefulBuilder(
                  builder: (context, setState) {
                    return NumberPicker(
                      value: currentValue.toInt(),
                      minValue: min!.toInt(),
                      maxValue: max!.toInt(),
                      selectedTextStyle: TextStyle(color: Theme.of(context).textTheme.bodyLarge?.color),
                      onChanged: (value) {
                        setState(() {
                          currentValue = value;
                        });
                      },
                    );
                  },
                ),
                const SizedBox(height: 12),
                //Bagian bawah
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    TextButton(
                      onPressed: () => Navigator.pop(context), // Tutup tanpa menyimpan
                      child: Text("Batal", style: TextStyle(color: Theme.of(context).textTheme.bodyLarge?.color)),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        controller.text = currentValue.toString(); // Simpan pilihan
                        onNumberPicked!(currentValue.toInt());
                        Navigator.pop(context);
                      },
                      child: Text("OK", style: TextStyle(color: Theme.of(context).textTheme.bodyLarge?.color)),
                    ),
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }

  void _showDatePicker(BuildContext context) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(primary: Theme.of(context).primaryColor),
            buttonTheme: ButtonThemeData(textTheme: ButtonTextTheme.primary),
          ),
          child: child!,
        );
      },
    );

    if (pickedDate != null) {
      String formattedDate = DateFormat('dd-MM-yyyy').format(pickedDate);
      controller.text = formattedDate;
    }
  }
}

