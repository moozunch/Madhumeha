import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget{
  final String label;
  final Color color;
  final Color textColor;
  final double width;
  final bool isSelected;
  final bool isToggle;
  final VoidCallback onPressed; //menggunakan voidcallback karena tidak mengembalikan nilai

  //constructor
const PrimaryButton ({
  super.key,
  required this.label,
  required this.color,
  required this.textColor,
  this.isSelected = false,
  this.isToggle = false,
  this.width = double.infinity, //menggunakan double.infinity agar button memenuhi layar
  required this.onPressed,
});

  @override
  Widget build(BuildContext context) {
    Color backgroundColor;
    Color textColor;
    if (isToggle) {
      backgroundColor = isSelected ? Theme.of(context).primaryColor : Colors.grey.shade300;
      textColor = isSelected ? Colors.white : Colors.black;
    } else {
      // Jika bukan toggle, gunakan warna statis
      backgroundColor = color ?? Theme.of(context).primaryColor;
      textColor = Colors.white;
    }
    return GestureDetector(
      onTap: onPressed,
      child: Container(
          width: width,
          height: 50,
          padding: const EdgeInsets.symmetric(vertical: 10),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(100),
            ),
        child: Text(
          label,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: textColor, fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}