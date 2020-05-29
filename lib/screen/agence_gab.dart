import 'dart:async';
import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:trouvetongab/screen/agence.dart';

class AgenceGab extends StatefulWidget {
  @override
  _AgenceGabState createState() => _AgenceGabState();
}

class _AgenceGabState extends State<AgenceGab> with SingleTickerProviderStateMixin{

  TabController controller;

  @override
  void initState() {
    super.initState();
    controller = new TabController(vsync: this, length: 2);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Banque name"),
          bottom: TabBar(
            controller: controller,
            indicatorColor: Color(0xffe2b80e),
            tabs: [
              Tab(text: "Agences",),
              Tab(text: "GAB/DAB",),
            ],
          ),
        ),

        body: TabBarView(
          controller: controller,
          children: [
            new Agence(),
            Icon(Icons.map),
          ],
        ),

      );

  }
}
