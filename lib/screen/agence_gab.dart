import 'package:flutter/material.dart';

class AgenceGab extends StatefulWidget {
  @override
  _AgenceGabState createState() => _AgenceGabState();
}

class _AgenceGabState extends State<AgenceGab> {

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Banque name"),
          bottom: TabBar(
            indicatorColor: Color(0xffe2b80e),
            tabs: [
              Tab(text: "Agences",),
              Tab(text: "GAB/DAB",),
            ],
          ),
        ),

        body: TabBarView(
          children: [
            Icon(Icons.directions_car),
            Icon(Icons.directions_transit),
          ],
        ),
      ),
    );
  }
}
