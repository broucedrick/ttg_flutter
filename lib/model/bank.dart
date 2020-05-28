import 'package:flutter/material.dart';

class Bank {
  final int index;
  final String title;
  final String image;

  Bank(this.index, this.title, this.image);
 
  // factory Bank.fromJson(Map<String, dynamic> json) {
  //   return Bank(
  //     index: json['id'],
  //     title: json['student_name'],
  //     image: json['student_phone_number'],
  //   );
  // }
}