import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';



class Slide {
  final String imageUrl;

  Slide({
    @required this.imageUrl
  });
}