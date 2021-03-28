import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_tasjid/src/component/my_icon_icons.dart';
import 'package:flutter_tasjid/src/model/model_dzikir.dart';
import 'package:flutter_tasjid/src/utils/constants.dart';
import 'package:flutter_tasjid/src/utils/custom_clipper.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hijri/hijri_calendar.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:volume/volume.dart';
import 'package:wakelock/wakelock.dart';
import 'package:hardware_buttons/hardware_buttons.dart' as HardwareButtons;

import 'lock_view.dart';

class JournalScreen extends StatefulWidget {
  @override
  _JournalScreenState createState() => _JournalScreenState();
}

class _JournalScreenState extends State<JournalScreen> {
  String _latestHardwareButtonEvent;
  StreamSubscription<HardwareButtons.VolumeButtonEvent>
  _volumeButtonSubscription;
  StreamSubscription<HardwareButtons.HomeButtonEvent> _homeButtonSubscription;
  StreamSubscription<HardwareButtons.LockButtonEvent> _lockButtonSubscription;
  int maxVol, currentVol;

  int _counter = 0;
  bool isClicked = true;
  bool isCardList = true;
  int _currentIndex = 0;
  var _today = HijriCalendar.now();
  var text = "0";
  var dizkirData = [
    new ModelDzikir(
        id: 0,
        name: "سُبْحَانَ اللّهُ",
        read: "Subhanallah",
        translate: "Maha Suci Allah"),
    new ModelDzikir(
        id: 1,
        name: "اَلْحَمْدُلِلّهِ",
        read: "Alhamdulillah",
        translate: "Segala Puji Bagi Allah"),
    new ModelDzikir(
        id: 2,
        name: "اَللّهُ اَكْبَرُ",
        read: "Allahu Akbar",
        translate: "Maha Besar Allah"),
    new ModelDzikir(
        id: 3,
        name: "لاَ اِلَهَ اِلاَّ اللّهُ",
        read: "Laa Ilaaha Ilallah",
        translate: "Tiada Tuhan Selain Allah")
  ];

  TextEditingController _dzikir = TextEditingController();

  @override
  void initState() {
    super.initState();
    _currentIndex = 0;
    initAudioStreamType();
    updateVolumes();
    _volumeButtonSubscription =
        HardwareButtons.volumeButtonEvents.listen((event) {
          setState(() {
            _counter++;
            _latestHardwareButtonEvent = event.toString();
          });
        });
    _homeButtonSubscription = HardwareButtons.homeButtonEvents.listen((event) {
      setState(() {
        _latestHardwareButtonEvent = 'HOME_BUTTON';
      });
    });

    _lockButtonSubscription = HardwareButtons.lockButtonEvents.listen((event) {
      setState(() {
        _latestHardwareButtonEvent = 'LOCK_BUTTON';
      });
    });
  }

  Future<void> initAudioStreamType() async {
    await Volume.controlVolume(AudioManager.STREAM_MUSIC);
  }

  updateVolumes() async {
    maxVol = await Volume.getMaxVol;
    currentVol = await Volume.getVol;
    setState(() {
      _counter++;
      print("Clicked");
    });
  }

  setVol(int i) async {
    await Volume.setVol(i, showVolumeUI: ShowVolumeUI.HIDE);
  }

  @override
  void dispose() {
    super.dispose();
    _volumeButtonSubscription?.cancel();
    _homeButtonSubscription?.cancel();
    _lockButtonSubscription?.cancel();
  }

  createAlertDialogDzikir(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        title: Text(
          "Tambah Dzikir",
          style: GoogleFonts.poppins(fontWeight: FontWeight.w700, fontSize: 16),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            _divider(24, 24),
            _textField('Masukan Dzikir', _dzikir),
            _divider(0, 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Container(
                  height: 40,
                  decoration:
                  BoxDecoration(border: Border.all(color: kPrimaryColor)),
                  child: OutlineButton(
                      child: Text(
                        "Kembali",
                        style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w600, color: kPrimaryColor),
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      }),
                ),
                FlatButton(
                  height: 40,
                  color: kPrimaryColor,
                  child: Text(
                    "Tambah",
                    style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w600, color: Colors.white),
                  ),
                  onPressed: () {
                    setState(() {
                      _dzikir.text;
                    });
                    Navigator.pop(context);
                  },
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  alerDialogList(BuildContext context) => AlertDialog(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    content: GestureDetector(
      child: Container(
        width: 900,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            for (var element in dizkirData)
              _listCard(element.name, element.read, element.translate, () {
                setState(() {
                  _currentIndex = element.id;
                  isCardList = !isCardList;
                });
              }),
          ],
        ),
      ),
      onTap: () {},
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: Column(
        children: <Widget>[_body(context)],
      ),
    );
  }

  // Body
  Widget _body(BuildContext context) {
    return Stack(
      children: <Widget>[
        ClipPath(
          clipper: CustomClipperAppBar(),
          child: Container(
            height: 170,
            color: kPrimaryColor,
          ),
        ),
        Align(
          child: Container(
            margin:
            EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.26),
            width: 180,
            alignment: Alignment.center,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  CircleAvatar(
                    backgroundColor: kPrimaryColor.withOpacity(0.2),
                    child: IconButton(
                      icon: Icon(
                        MyIcon.sound,
                        color: kPrimaryColor,
                      ),
                      onPressed: () {
                        updateVolumes();
                        setVol(_counter);
                      },
                    ),
                  ),
                  CircleAvatar(
                    backgroundColor: kPrimaryColor.withOpacity(0.2),
                    child: IconButton(
                      icon: Icon(
                        MyIcon.lock,
                        color: kPrimaryColor,
                      ),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    LockView(mCounter: _counter)));
                        setState(() {
                          Wakelock.enabled;
                          print('enable');
                        });
                      },
                    ),
                  ),
                  CircleAvatar(
                    backgroundColor: kPrimaryColor.withOpacity(0.2),
                    child: IconButton(
                      icon: Icon(
                        MyIcon.refresh,
                        color: kPrimaryColor,
                      ),
                      onPressed: () {
                        setState(() {
                          _counter = 0;
                        });
                      },
                    ),
                  )
                ]),
          ),
        ),
        GestureDetector(
          child: Align(
            child: Container(
              decoration:
              BoxDecoration(borderRadius: BorderRadius.circular(100)),
              margin: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.35),
              width: 156,
              height: 156,
              child: CircleAvatar(
                backgroundColor: kPrimaryColor,
                child: AnimatedCrossFade(
                  crossFadeState: isClicked
                      ? CrossFadeState.showFirst
                      : CrossFadeState.showSecond,
                  duration: Duration(milliseconds: 200),
                  firstChild: CircularPercentIndicator(
                    radius: 156,
                    center: Text(
                      "0",
                      style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                          fontSize: 40),
                    ),
                  ),
                  secondChild: GestureDetector(
                    child: CircularPercentIndicator(
                      radius: 156,
                      center: Text(
                        "$_counter",
                        style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                            fontSize: 70),
                      ),
                    ),
                    onTap: () {
                      setState(() {
                        if (_counter != 2000) {
                          _counter++;
                        }
                      });
                    },
                  ),
                ),
              ),
            ),
          ),
          onTap: () {
            setState(() {
              isClicked = !isClicked;
            });
          },
        ),
        Align(
          child: Container(
            margin: EdgeInsets.only(
                top: MediaQuery.of(context).size.height * 0.62,
                left: MediaQuery.of(context).size.height * 0.32),
            width: 90,
            height: 35,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: kPrimaryColor.withOpacity(0.2)),
            child: TextButton(
              onPressed: () {
                createAlertDialogDzikir(context);
              },
              child: Text(_dzikir.text,
                  style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w500, color: kPrimaryColor)),
            ),
          ),
        ),
        GestureDetector(
          child: AnimatedCrossFade(
            crossFadeState: isCardList
                ? CrossFadeState.showFirst
                : CrossFadeState.showSecond,
            firstChild: _cardOfDzikir(
                dizkirData[_currentIndex].name,
                dizkirData[_currentIndex].read,
                dizkirData[_currentIndex].translate, () {
              setState(() {
                isCardList = !isCardList;
              });
            }),
            secondChild: alerDialogList(context),
            duration: Duration(milliseconds: 200),
          ),
          onTap: () {
            setState(() {
              isCardList = !isCardList;
            });
          },
        ),
      ],
    );
  }

  // App Bar
  Widget _appBar() {
    return PreferredSize(
      preferredSize: Size.fromHeight(120),
      child: AppBar(
        backgroundColor: Color(0xff35B74E),
        elevation: 0,
        flexibleSpace: Stack(
          alignment: Alignment.centerLeft,
          children: [
            FlexibleSpaceBar(
              centerTitle: true,
              title: Container(
                width: 248,
                margin: EdgeInsets.only(right: 120, top: 60),
                alignment: Alignment.centerLeft,
                child: Column(
                  children: [
                    Container(
                      width: 180,
                      alignment: Alignment.centerLeft,
                      child: Text("${_today.getDayName()}",
                          style: GoogleFonts.scheherazade(
                              fontWeight: FontWeight.w400, fontSize: 18)),
                    ),
                    Container(
                      width: 180,
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "${_today.fullDate()}",
                        style: GoogleFonts.scheherazade(
                            fontWeight: FontWeight.w700, fontSize: 18),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        actions: [
          Container(
            margin: EdgeInsets.only(left: 8),
            child: IconButton(
              icon: Icon(Icons.more_vert, color: Colors.white),
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }

  Widget _cardOfDzikir(String nameDzikir, name, translate, Function function) {
    return GestureDetector(
      child: Container(
        margin: EdgeInsets.fromLTRB(16, 30, 16, 0),
        width: double.infinity,
        height: 130,
        child: Card(
          shadowColor: Colors.black38,
          shape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          elevation: 4,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                nameDzikir,
                style: GoogleFonts.scheherazade(fontSize: 30),
              ),
              Text(name,
                  style: GoogleFonts.poppins(fontStyle: FontStyle.italic)),
              Text(
                translate,
                style: GoogleFonts.poppins(fontSize: 15, color: Colors.black38),
              )
            ],
          ),
        ),
      ),
      onTap: function,
    );
  }

  Widget _textField(String title, TextEditingController controller) {
    return Theme(
      data: ThemeData(primaryColor: kPrimaryColor),
      child: Container(
        margin: EdgeInsets.only(bottom: 25),
        child: TextField(
          decoration: InputDecoration(
              fillColor: kPrimaryColor,
              labelText: title,
              border: OutlineInputBorder(
                  borderSide: BorderSide(color: kPrimaryColor))),
          controller: controller,
        ),
      ),
    );
  }

  Widget _listCard(String name, read, translate, Function function) {
    return GestureDetector(
      child: Container(
        width: double.infinity,
        child: Column(
          children: [
            Text(
              name,
              style: GoogleFonts.poppins(fontSize: 25),
            ),
            Text(
              read,
              style: GoogleFonts.poppins(
                  fontStyle: FontStyle.italic, color: Colors.black54),
            ),
            Text(
              translate,
              style: GoogleFonts.poppins(color: Colors.black38),
            ),
            _divider(10, 10)
          ],
        ),
      ),
      onTap: function,
    );
  }

  Widget _divider(double martop, double marbot) {
    return Container(
      margin: EdgeInsets.only(top: martop, bottom: marbot),
      child: Divider(
        height: 2,
        color: Colors.grey,
        indent: 2,
        endIndent: 2,
      ),
    );
  }
}
