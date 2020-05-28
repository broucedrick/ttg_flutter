import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

class BankList extends StatefulWidget {
  @override
  _BankListState createState() => _BankListState();
}

class _BankListState extends State<BankList> {

  Future<List<Bank>> _getBank() async{
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

    if(data.statusCode == 200){
      var jsonData = json.decode(data.body);
      print(jsonData);
      List<Bank> banks = [];
      int i=0;

      while(i<jsonData.length){
        print(jsonData[i]);
        // Bank bank = Bank(jsonData[i]['id'], jsonData[i]['title'], jsonData[i]['image']);
        banks.add(new Bank(jsonData[i]['id'], jsonData[i]['title'], jsonData[i]['image']));
        print(banks.length);
        i++;
      }

      print(banks.length);

      return banks;
    }else{
      print('Failed to load data from Server.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Banques'),
      ),
      body: Container(
        child: FutureBuilder(
          future: _getBank(),
          builder: (context, snapShot){
            // if(snapShot.hasData){
              return GridView.count(
                // Create a grid with 2 columns. If you change the scrollDirection to
                // horizontal, this produces 2 rows.
                crossAxisCount: 3,
                // Generate 100 widgets that display their index in the List.
                children: List.generate(100, (index) {
                  return Center(
                    child: Container(
                      padding: const EdgeInsets.all(30),
                      margin: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                        shape: BoxShape.rectangle,
                        color: Colors.white,
                      ),
                      child: Text(
                        'Item $index',
                        style: Theme.of(context).textTheme.headline5,
                      ),
                    )
                  );
                }),
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
          },
        )
      ),
    );
  }
}

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