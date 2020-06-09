import 'package:flutter/material.dart';

class IntroSlideDots extends StatelessWidget {
  bool isActive;
  IntroSlideDots(this.isActive);

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 150),
      margin: const EdgeInsets.symmetric(horizontal: 5),
      height: isActive ? 8 : 8,
      width: isActive ? 8 : 8,
      decoration: BoxDecoration(
          color: isActive ? Color(0xffe2b80e) : Colors.grey,
          borderRadius: BorderRadius.all(Radius.circular(12))
      ),

    );
  }
}