import 'package:flutter/material.dart';
import 'package:trouvetongab/screen/bank_list.dart';
import '../widgets/slide_dots.dart';
import '../widgets/slide_item.dart';
import '../model/slide.dart';
import 'dart:async';
import 'package:url_launcher/url_launcher.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentPage = 0;
  final PageController _pageController = PageController(
    initialPage: 0
  );

  @override
  void initState() {
    super.initState();
    Timer.periodic(Duration(seconds: 5), (Timer timer){
      if(_currentPage < 2){
        _currentPage++;
      }else{
        _currentPage = 0;
      }

      _pageController.animateToPage(
        _currentPage, 
        duration: Duration(milliseconds: 300), 
        curve: Curves.easeIn
      );
    });
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  _onPageChanged(int index){
    setState(() {
      _currentPage = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    
    Color df_yellow = Color(0xffe2b80e);
    // Scaffold is a layout for the major Material Components.
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.menu),
          tooltip: 'Navigation menu',
          onPressed: null,
        ),
        title: Text('Home'),
      ),
      // body is the majority of the screen.
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Container(
              child: Stack(
                alignment: AlignmentDirectional.bottomCenter,
                children: <Widget>[
                  PageView.builder(
                    scrollDirection: Axis.horizontal,
                    controller: _pageController,
                    onPageChanged: _onPageChanged,
                    itemCount: slideList.length,
                    itemBuilder: (ctxt, i) => SlideItem(i),  
                  ),
                  Stack(
                    alignment: AlignmentDirectional.topStart,
                    children: <Widget>[
                      Container(
                        margin: const EdgeInsets.only(bottom: 10),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            for(int i=0; i<slideList.length; i++)
                              if(i == _currentPage)
                                SlideDots(true)
                              else
                                SlideDots(false)
                          ],
                        ),
                      )
                    ],
                  )
                ],
              ),
            )
           
          ),
          Expanded(
            flex: 3,
            child: Container(   
              alignment: AlignmentDirectional.center,             
              child: Column(
                children: <Widget>[
                  Container(
                    alignment: AlignmentDirectional.center,
                    margin: const EdgeInsets.only(bottom: 8),
                    height: MediaQuery.of(context).size.height/1.7,
                    padding: const EdgeInsets.all(30),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(bottomRight: Radius.circular(30), bottomLeft: Radius.circular(30)),
                      color: Colors.white
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        RaisedButton(
                          child: Text(
                              "TROUVER UN GAB",
                              style: TextStyle(fontSize: 18.0),
                          ),
                          
                          textColor: Colors.white,
                          padding: const EdgeInsets.all(20),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
                          color: df_yellow,
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => BankList()),
                            );
                          },
                        ),
                        Divider(),
                        Divider(),
                        RaisedButton(
                          child: Text(
                              "DECLARER UN INCIDENT",
                            style: TextStyle(fontSize: 18.0),
                          ),
                          textColor: Colors.white,
                          padding: const EdgeInsets.all(20),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
                          color: df_yellow,
                          onPressed: () {},
                        ),
                        Divider(),
                        Divider(),
                        RaisedButton(
                          child: Text("MARKETPLACE DIGITALE FINANCES",
                            style: TextStyle(fontSize: 18.0),),
                          textColor: Colors.white,
                          padding: const EdgeInsets.all(20),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
                          color: df_yellow,
                          onPressed: _markertplaceUrl,
                        ),
                    ],),
                  ),
                  Container(
                    alignment: AlignmentDirectional.center,
                    width: MediaQuery.of(context).size.width/3,
                    child: Column(
                      children: <Widget>[
                        Center(
                          child: Image(
                            image: AssetImage('assets/images/df_logo.png')),
                        )
                        
                      ],
                    ),
                  ),
                  
                ],)
            ) 
            
            ),
            
            
        ],)
           
    );
  }

  _markertplaceUrl() async{
    const url = 'https:www.digitalefinances.com';
    if(await canLaunch(url)){
      await launch(url);
    }else{
      throw 'Could not launch $url';
    }
  }

}