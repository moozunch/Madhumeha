import 'package:flutter/material.dart';

class DropDown extends StatefulWidget{
  final String label;
  final List<String> items;
  final String? initialValue;
  final ValueChanged<String> onChanged;

  //Constructor
  const DropDown({
    super.key,
    required this.label,
    required this.items,
    this.initialValue,
    required this.onChanged,
});

  @override
  State<DropDown> createState() => _DropDownState();
}


//State, kondisi dan widget
class _DropDownState extends State<DropDown> {
  String? selectedValue;
  
  void initState(){ //keadaan awalnya entah itu sesuai yang ditentukan dari app atau item first diambil dari widget
    super.initState();
    selectedValue = widget.initialValue ?? widget.items.first;
  }
  //widgeet
  @override
  Widget build(BuildContext context){
    return GestureDetector(
        onTap: () {
      FocusScope.of(context).unfocus(); // menutup keyboard jika tap di luar input
    },
      child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.label,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            fontWeight: FontWeight.w600,
          )
        ),
        const SizedBox(height: 8,),
        DropdownButtonFormField<String>(
          value: selectedValue,
          items: widget.items.map((String item) {//item list nya jadi string just in case
            return DropdownMenuItem(
              value: item,
              child: Text(item),
            );
          }).toList(),
          onChanged: (value) {
           setState(() {
            selectedValue = value;
          });
          widget.onChanged(value!);
     },
  decoration: InputDecoration(
  border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
  contentPadding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
  focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Theme.of(context).primaryColor )),
  ),
          autofocus: false,),
      ]) );
  }//keadaan awalnya
}