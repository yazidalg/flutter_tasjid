import 'package:flutter/material.dart';
import 'package:flutter_tasjid/src/component/botnav.dart';
import 'package:flutter_tasjid/src/screen/boarding.dart';
import 'package:flutter_tasjid/src/screen/daftar_dzikir.dart';
import 'package:flutter_tasjid/src/screen/lock_view.dart';
import 'package:flutter_tasjid/src/screen/referensi_doa.dart';
import 'package:flutter_tasjid/src/screen/referensi_ustad.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: BoardingScreen(), routes: {
      '/bottomNavigation': (context) => MyBottomNavigation(),
      '/referensiUst': (context) => ReferensiUstadScreen(),
      '/referensiDoa': (context) => ReferensiDoaScreen(),
      '/daftarDzikir': (context) => DaftarDzikir(),
      '/lockView': (context) => LockView(),
    });
  }
}
