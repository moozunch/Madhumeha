import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget{
  final String label;
  final Color color;
  final Color textColor;
  final double width;
  final VoidCallback onPressed; //menggunakan voidcallback karena tidak mengembalikan nilai

  //constructor
const PrimaryButton ({
  super.key,
  required this.label,
  required this.color,
  required this.textColor,
  this.width = double.infinity, //menggunakan double.infinity agar button memenuhi layar
  required this.onPressed,
});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: 50,
      child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: color,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(100),
            ),
            padding: const EdgeInsets.symmetric(vertical: 10),
          ),
        child: Text(
          label,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: textColor),
        ),
      ),
    );
  }
}