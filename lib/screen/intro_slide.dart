import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:trouvetongab/screen/home.dart';
import 'package:trouvetongab/widgets/intro_slide_dot.dart';

import 'login.dart';

class IntroSlide extends StatefulWidget {
  @override
  _IntroSlideState createState() => _IntroSlideState();
}

class _IntroSlideState extends State<IntroSlide> {
  bool btn_visibility = true;
  int _currentPage = 0;
  final PageController _pageController = PageController(
      initialPage: 0
  );

  List slide_id = [1, 2, 3];
  List desc_title = ['Trouve ton GAB',
    "Déclarer un incident\nbancaire",
    "Market Place\nDigitale Finances"];
  List desc = ["Retrouvez l'ensemble des\nguichets automatiques de toutes\nles banques avec leurs statuts\nde disponibilité",
               "Déclarer un incident rencontré\nlors d'une opération dans un\nguichet automatique",
               "Se rendre sur la market place\nde la rue des banque en ligne\nwww.digitalefinances.com"];
  List button_text = ["Suivant","Suivant","Commencer"];

  String btn_text;

  @override
  void initState(){
    //getIntro();
    super.initState();
  }

  void nextPage(){
    _currentPage++;

    _pageController.animateToPage(
        _currentPage,
        duration: Duration(milliseconds: 300),
        curve: Curves.easeIn
    );

    if(_currentPage == slide_id.length){
      introView();
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => Login())
      );
    }
  }

  void prevPage(){
    if(_currentPage == 0){
      _currentPage = 0;
    }else{
      _currentPage--;
    }

    _pageController.animateToPage(
        _currentPage,
        duration: Duration(milliseconds: 300),
        curve: Curves.easeIn
    );
  }



  @override
  void dispose() {;
    super.dispose();
    _pageController.dispose();
  }

  bool btnState(){
    setState(() {
      if(_currentPage == 0)
        btn_visibility = false;
      else
        btn_visibility = true;
    });

    return btn_visibility;
  }

  _onPageChanged(int index){
    setState(() {
      _currentPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onBackPressed,
      child: Container(
        color: Color(0xff303030),
        child: Flex(
          direction: Axis.vertical,
          children: <Widget>[
            Flex(
              crossAxisAlignment: CrossAxisAlignment.start,
              direction: Axis.horizontal,
              children: <Widget>[
                Visibility(
                  visible: btnState(),
                  maintainSize: true,
                  maintainAnimation: true,
                  maintainState: true,
                  child: Container(
                      color: Color(0xff303030),
                      margin: EdgeInsets.only(top: 56),
                      child: FlatButton(
                        onPressed: prevPage,
                        visualDensity: VisualDensity.compact,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Icon(Icons.arrow_back, color: Colors.white,),
                            Text("Retour", style: TextStyle(color: Colors.white, fontSize: 14, decoration: TextDecoration.none),),
                          ],
                        ),
                      )
                  ),
                )
              ],
            ),
            Expanded(
              child: Column(
                children: <Widget>[
                  Expanded(
                    flex: 7,
                    child: PageView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      controller: _pageController,
                      onPageChanged: _onPageChanged,
                      itemCount: slide_id.length,
                      itemBuilder: (ctxt, i) => Container(
                        color: Color(0xff303030),
                        alignment: AlignmentDirectional.center,
                        padding: EdgeInsets.all(10),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,

                          children: <Widget>[
                            Container(
                              padding: EdgeInsets.all(20),
                              decoration: BoxDecoration(shape: BoxShape.circle, color: Color(0xffe2b80e)),
                              child: Text(slide_id[i].toString(), style: TextStyle(color: Colors.white, fontSize: 20, decoration: TextDecoration.none)),
                            ),
                            Container(
                              margin: EdgeInsets.all(20),
                              child: Text(desc_title[i], style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold, decoration: TextDecoration.none), textAlign: TextAlign.center),
                            ),
                            Text(desc[i], style: TextStyle(color: Colors.white, fontSize: 16,  decoration: TextDecoration.none), textAlign: TextAlign.center),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    color: Color(0xff303030),
                    margin: const EdgeInsets.only(bottom: 10),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        for(int i=0; i<slide_id.length; i++)
                          if(i == _currentPage)
                            IntroSlideDots(true)
                          else
                            IntroSlideDots(false)
                      ],
                    ),
                  ),
                  Container(
                    color: Color(0xff303030),
                    margin: EdgeInsets.only(left: 20, right: 20, bottom: 30),
                    child: RaisedButton(
                      child: Text(button_text[_currentPage],
                        style: TextStyle(fontSize: 15.0),),
                      textColor: Colors.white,
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
                      color: Color(0xffe2b80e),
                      onPressed: (){
                        nextPage();
                      },
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Future<bool> _onBackPressed(){
    Navigator.of(context).pop(true);
  }

  introView() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('viewed', true);
  }
  /*getIntroView() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //Return bool
    bool viewed;
    if(prefs.containsKey('viewed'))
      viewed = prefs.getBool('viewed');
    else
      viewed = null;
    return viewed;
  }*/
}
