import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tasjid/src/utils/constants.dart';
import 'package:google_fonts/google_fonts.dart';

class BoardingScreen extends StatefulWidget {
  @override
  _BoardingScreenState createState() => _BoardingScreenState();
}

class _BoardingScreenState extends State<BoardingScreen> {
  PageController _pageController = PageController();
  double _currentPosition = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          PageView(
            physics: ClampingScrollPhysics(),
            controller: _pageController,
            children: <Widget>[_boarding1(), _boarding2(), _boarding3()],
          ),
          Container(
            alignment: Alignment.center,
            margin:
            EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.6),
            child: DotsIndicator(
              dotsCount: 3,
              onTap: (value) {
                setState(() {
                  _currentPosition = value;
                });
              },
            ),
          )
        ],
      ),
    );
  }

  Widget _boarding1() {
    return Container(
        child: Stack(
          alignment: Alignment.center,
          children: [
            Image.asset('images/logo.png'),
            Container(
              width: 150,
              margin:
              EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.15),
              child: Text("Remember Him Whenever Wherever",
                  textAlign: TextAlign.center, style: GoogleFonts.poppins()),
            ),
            Positioned(top: 0, right: 0, child: Image.asset('images/img-top.png')),
            Positioned(
                bottom: 0, left: 0, child: Image.asset('images/img-bottom.png'))
          ],
        ));
  }

  Widget _boarding2() {
    return Container(
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Image.asset('images/boarding1.png'),
          Container(
              width: 180,
              margin: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.38),
              child: Text("Mudahnya Bertasbih dimanapun kapanpun",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(fontWeight: FontWeight.w600))),
        ],
      ),
    );
  }

  Widget _boarding3() {
    return Container(
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Image.asset('images/boarding2.png'),
          Container(
              width: 180,
              margin: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.38),
              child: Text("Meningkatkan Target Dzikir Harian kamu",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(fontWeight: FontWeight.w600))),
          Container(
            margin:
            EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.8),
            width: 292,
            height: 40,
            child: RaisedButton(
                color: kPrimaryColor,
                child: Text("Start"),
                onPressed: () {
                  Navigator.pushReplacementNamed(context, '/bottomNavigation');
                }),
          )
        ],
      ),
    );
  }
}
