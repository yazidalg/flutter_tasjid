import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_tasjid/src/utils/constants.dart';
import 'package:slide_to_act/slide_to_act.dart';
import 'package:volume/volume.dart';
import 'package:wakelock/wakelock.dart';
import 'package:hardware_buttons/hardware_buttons.dart' as HardwareButtons;

class LockView extends StatefulWidget {
  final int mCounter;

  const LockView({Key key, this.mCounter}) : super(key: key);
  @override
  _LockViewState createState() => _LockViewState();
}

class _LockViewState extends State<LockView> {
  String _latestHardwareButtonEvent;
  StreamSubscription<HardwareButtons.VolumeButtonEvent>
  _volumeButtonSubscription;
  StreamSubscription<HardwareButtons.HomeButtonEvent> _homeButtonSubscription;
  StreamSubscription<HardwareButtons.LockButtonEvent> _lockButtonSubscription;
  int maxVol, currentVol;
  int _counter = 0;

  @override
  void initState() {
    super.initState();
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

  @override
  Widget build(BuildContext context) {
    setState(() {
      _counter = widget.mCounter;
    });
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text("Your Dzikir is"),
            Text(
              "${widget.mCounter}",
              style: TextStyle(fontSize: 60, color: Colors.white),
            ),
            Center(
              child: Container(
                width: double.infinity,
                height: 70,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(80),
                ),
                child: SlideAction(
                  text: "Buka Kunci",
                  elevation: 1,
                  sliderButtonIcon: Icon(Icons.arrow_forward),
                  sliderButtonIconSize: 90,
                  outerColor: Colors.transparent,
                  animationDuration: Duration(milliseconds: 300),
                  onSubmit: () {
                    Navigator.pop(context);
                    setState(() {
                      Wakelock.disable();
                      print('disable');
                    });
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
