import 'package:flutter/material.dart';

class SliderBar extends StatefulWidget {
  const SliderBar({Key? key}) : super(key: key);

  @override
  State<SliderBar> createState() => _SliderBarState();
}

class _SliderBarState extends State<SliderBar> {
  double currentSliderValue =0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Slider(
        min: 0,
        max: 10,
        value: currentSliderValue,
        onChanged: (newRating) {
          setState(() => currentSliderValue = newRating);
        },
      ),
    );
  }
}
