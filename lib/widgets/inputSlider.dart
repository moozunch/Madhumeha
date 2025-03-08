import 'package:flutter/material.dart';

class InputSlider extends StatefulWidget {
  final String label;
  final double min;
  final double max;
  final int divisions;
  final String unit;
  final ValueChanged<double>? onChanged;

  //constructor
  const InputSlider({
    super.key,
    required this.label,
    this.min = 0.0,
    this.max = 100.0,
    this.divisions = 10,
    this.unit = '',
    this.onChanged,
  });

  @override
  State<InputSlider> createState() => _SliderState();
}

class _SliderState extends State<InputSlider> {
  double _currentValue = 0.0;

  
  //Slider
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.label,
          style: Theme.of(context).textTheme.bodyMedium),
          const SizedBox(height: 8),
        Slider(
            value: _currentValue,
            min: widget.min,
            max: widget.max,
            divisions: widget.divisions,
            activeColor: Theme.of(context).primaryColor,
            label: '${_currentValue.toStringAsFixed(1)} ${widget.unit}',
            onChanged: (value) {
          setState(() {
            _currentValue = value;
          });
          if (widget.onChanged != null) {
            widget.onChanged!(value);// Mengirim data ke parent widget (misal InputScreen)
          }
        }),
        Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween, //jadi dia memenuhi di kiri dan kanan
            children: [
              Text('${widget.min.toInt()} ${widget.unit}'),
              Text('${widget.max.toInt()} ${widget.unit}'),
            ],
          ),
        ),
      ],
    );
  }
}