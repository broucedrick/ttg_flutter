import 'package:flutter/material.dart';

class Slide {
  final String imageUrl;

  Slide({
    @required this.imageUrl
  });
}


final slideList = [
  Slide(
    imageUrl: "assets/images/img1.jpg"
  ),
  Slide(
    imageUrl: "assets/images/img2.jpg"
  ),
  Slide(
    imageUrl: "assets/images/img3.jpg"
  )
];