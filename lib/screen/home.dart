import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:trouvetongab/screen/bank_list.dart';
import 'package:trouvetongab/screen/drawer_view.dart';
import '../widgets/slide_dots.dart';
import '../widgets/slide_item.dart';
import '../model/slide.dart';
import 'dart:async';
import 'package:url_launcher/url_launcher.dart';
import 'incident.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentPage = 0;
  final PageController _pageController = PageController(
    initialPage: 0
  );

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();


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
    var mediaQuery = MediaQuery.of(context);
    // Scaffold is a layout for the major Material Components.
    return Scaffold(
      key: _scaffoldKey,
      drawer: DrawerView(),
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.menu),
          tooltip: 'Navigation menu',
          onPressed: () => _scaffoldKey.currentState.openDrawer(),
        ),
        title: Text('Trouve ton GAB'),
      ),
      // body is the majority of the screen.
      body: Container(
        width: mediaQuery.size.width,
        height: mediaQuery.size.height,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              width: mediaQuery.size.width,
              height: mediaQuery.size.height/4,
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


            ),
            Container(
              width: mediaQuery.size.width,
              height: mediaQuery.size.height/2,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(15), bottomRight: Radius.circular(15)),
                color: Colors.white,
              ),
              alignment: AlignmentDirectional.center,
              child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(left: 20, right: 20),
                          child: RaisedButton(
                            child: Text(
                              "TROUVER UN GAB",
                              style: TextStyle(fontSize: 15.0),
                            ),

                            textColor: Colors.white,
                            padding: const EdgeInsets.all(15),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
                            color: df_yellow,
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => BankList()),
                              );
                            },
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 20, right: 20),
                          child: RaisedButton(
                            child: Text(
                              "DECLARER UN INCIDENT",
                              style: TextStyle(fontSize: 15.0),
                            ),
                            textColor: Colors.white,
                            padding: const EdgeInsets.all(15),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
                            color: df_yellow,
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => Incident())
                              );
                            },
                          ),
                        ),

                        Container(
                          margin: EdgeInsets.only(left: 20, right: 20),
                          child: RaisedButton(
                            child: Text("MARKETPLACE DIGITALE FINANCES",
                              style: TextStyle(fontSize: 15.0),),
                            textColor: Colors.white,
                            padding: const EdgeInsets.all(15),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
                            color: df_yellow,
                            onPressed: _markertplaceUrl,
                          ),
                        ),


                      ],

                  ),

            ),

           Expanded(
             child: Image(
               image: AssetImage('assets/images/df_logo.png'),
               width: mediaQuery.size.width/3,
             ),

           )

          ],
        ),
      )

           
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
