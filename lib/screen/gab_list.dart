import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

import 'package:trouvetongab/screen/agence_gab.dart';
import 'package:trouvetongab/screen/gab_list_item.dart';

class GabList extends StatefulWidget {

  final int bankid;

  GabList(this.bankid);

  @override
  _GabListState createState() => _GabListState();
}

class _GabListState extends State<GabList> {

  List gabs = [];

  @override
  void initState() {
    fetchData();
    super.initState();
  }

  void fetchData() async {
    final response = await http.get(
        'https://digitalfinances.innovstech.com/getGab.php?id='+widget.bankid.toString());

    if (response.statusCode == 200) {
      setState(() {
        gabs = json.decode(response.body);

      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: <Widget>[
              Expanded(
                  flex: 1,
                  child: Center(
                    child: TextField(
                    ),
                  )

              ),

              Expanded(
                  flex: 10,

                  child:GridView.extent(
                    maxCrossAxisExtent: 130.0,
                    childAspectRatio: 0.7,
                    children: new List<Widget>.generate(gabs.length, (index) {
                      return GabListItem(gabs[index]['title'], gabs[index]['location']);
                    }),
                  ),

                  /*child: GridView.count(
                      crossAxisCount: 3,
                      childAspectRatio: 0.7,
                      padding: const EdgeInsets.all(4.0),
                      children: new List<Widget>.generate(gabs.length, (index) {
                        return GabListItem(gabs[index]['title']);
                      })
                  )*/
              )
            ])
        )







    );


    // }else if(snapShot.hasError){
    // return Container(
    //   child: Center(
    //     child: Text("${snapShot.data}")
    //   ),
    // );
    // }
    /*child: GridView.builder(
      // Create a grid with 2 columns. If you change the scrollDirection to
      // horizontal, this produces 2 rows.
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            childAspectRatio: 0.7,
            mainAxisSpacing: 2,
            crossAxisSpacing: 2
        ),
        itemCount: gabs.length,
        itemBuilder: (context, index) {
          return GabListItem(gabs[index]['title']);

        }
      // Generate 100 widgets that display their index in the List.

    )

    )


    ],
    ),*/

    return Center(
        child: CircularProgressIndicator()
    );
  }
}



