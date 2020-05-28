import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

import 'package:trouvetongab/screen/agence_gab.dart';

class BankList extends StatefulWidget {
  @override
  _BankListState createState() => _BankListState();
}

class Bank {
  final int index;
  final String title;
  final String image;

  Bank({this.index, this.title, this.image});

  factory Bank.fromJson(Map<String, dynamic> json) {
    return Bank(
      index: json['id'],
      title: json['title'],
      image: json['image'],
    );
  }
}

class _BankListState extends State<BankList> {

  List banks = [];

  /*Future<List<Bank>> _getBank() async{
    var data = await http.get('https://digitalfinances.innovstech.com/getBanque.php');

    

    // if (data.statusCode == 200) { 
    //   List banks = json.decode(data.body);
    //   print(banks.length);
    //   return banks.map(
    //     (bank) => new Bank.fromJson(bank)
    //   ).toList();
    // }else {
    //   print('Failed to load data from Server.');
    // }

    var url = 'https://digitalfinances.innovstech.com/getBanque.php';


    // Await the http get response, then decode the json-formatted response.
    var response = await http.get(url);
    if (response.statusCode == 200) {

      var jsonResponse = convert.jsonDecode(response.body);
      //print(jsonResponse);
      for(var u in jsonResponse){
        //print(u['image']);
        banks.add(new Bank(u['id'], u['title'], u['image']));
        print(banks);
      }
      print(banks.length);
      return banks;
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }*/


  @override
  void initState() {
    fetchData();
    super.initState();
  }

  void fetchData() async {
    final response = await http.get(
        'https://digitalfinances.innovstech.com/getBanque.php');

    if (response.statusCode == 200) {
      setState(() {
        banks = json.decode(response.body);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Banques'),
        ),
        body: Container(
          child: Column(
            children: <Widget>[
              Expanded(
                  flex: 1,
                  child: Center(
                    child: Text(
                      "Choisi ta banque",
                      style: TextStyle(fontSize: 20.0),
                    ),
                  )

              ),

              Expanded(
                  flex: 10,

                  child: GridView.builder(
                    // Create a grid with 2 columns. If you change the scrollDirection to
                    // horizontal, this produces 2 rows.
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3, mainAxisSpacing: 0
                      ),
                      padding: const EdgeInsets.all(5),
                      itemCount: banks.length,
                      itemBuilder: (context, index) {
                        return Container(
                            padding: EdgeInsets.all(0),
                            margin: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(10))),
                            child: ConstrainedBox(
                            constraints: BoxConstraints.expand(),
                            child:FlatButton(
                                color: Colors.white,
                                child: Image.network(
                                  banks[index]['image'],
                                ),
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => AgenceGab()),
                                  );
                                },

                              )
                            )
                        );

                      }
                    // Generate 100 widgets that display their index in the List.

                  )

              )


            ],
          ),
        )

    );


    // }else if(snapShot.hasError){
    // return Container(
    //   child: Center(
    //     child: Text("${snapShot.data}")
    //   ),
    // );
    // }

    return Center(
        child: CircularProgressIndicator()
    );
  }
}

