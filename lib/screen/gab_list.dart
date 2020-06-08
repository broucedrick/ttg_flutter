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
  List gabs_list = [];

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
        gabs_list.addAll(gabs);
      });
    }
  }
  TextEditingController editingController = TextEditingController();


  void filterSearchResults(String query) {
    List search = [];
    search.addAll(gabs_list);
    if(query.isNotEmpty) {
      List searchlist =[];
      search.forEach((item) {
        if(item['commune'].toString().toLowerCase().contains(query)) {
          searchlist.add(item);
        }
      });
      setState(() {
        gabs.clear();
        gabs.addAll(searchlist);
      });
      return;
    } else {
      setState(() {
        gabs.clear();
        gabs.addAll(gabs_list);
      });
      return;
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
                Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                child: Theme(
                  data: ThemeData(
                    primaryColor: Colors.white,
                    primaryColorDark: Colors.white
                  ),
                  child: TextField(
                    controller: editingController,
                    style: TextStyle(color: Colors.black, fontSize: 18),
                    onChanged: (value) {
                      filterSearchResults(value);
                    },
                    cursorColor: Colors.black,
                    decoration: InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        hintText: "Recherche par commune ou ville",
                        prefixIcon: Icon(Icons.search, color: Colors.black, ),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.red),
                        )
                    ),
                ),
              )),


              Expanded(
                  child:GridView.extent(
                    maxCrossAxisExtent: 130.0,
                    childAspectRatio: 0.6,
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



