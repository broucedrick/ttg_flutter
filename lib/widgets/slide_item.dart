
import 'dart:convert';

import 'package:flutter/material.dart';
import '../model/slide.dart';
import 'package:http/http.dart' as http;

class SlideItem extends StatefulWidget {
  final int index;
  SlideItem(this.index);

  @override
  _SlideItemState createState() => _SlideItemState();
}

class _SlideItemState extends State<SlideItem> {
  List slideList = [];

  @override
  void initState() {
    getImageUrl();
    super.initState();
  }

  void getImageUrl() async {
    final response = await http.get(
        'https://digitalfinances.innovstech.com/getSlides.php');
    if (response.statusCode == 200) {
      slideList = json.decode(response.body);
      print(slideList);
    }
  }

  @override
  Widget build(BuildContext context){
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        image: DecorationImage(image: NetworkImage('http://digitalfinances.innovstech.com/backoffice/img/post/'+slideList[widget.index]['image']),
        fit: BoxFit.fill)
      ),
    );
  }
}