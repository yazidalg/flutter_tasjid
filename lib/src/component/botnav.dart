import 'package:flutter/material.dart';
import 'package:flutter_tasjid/src/screen/doa.dart';
import 'package:flutter_tasjid/src/screen/journal.dart';
import 'package:flutter_tasjid/src/screen/more.dart';
import 'package:flutter_tasjid/src/screen/pesan_ustad.dart';
import 'package:flutter_tasjid/src/utils/constants.dart';
import 'package:google_fonts/google_fonts.dart';

import 'my_icon_icons.dart';

class MyBottomNavigation extends StatefulWidget {
  @override
  _MyBottomNavigationState createState() => _MyBottomNavigationState();
}

class _MyBottomNavigationState extends State<MyBottomNavigation> {
  // Bottom Navigation
  List<BottomNavigationBarItem> _botNavItem = [
    BottomNavigationBarItem(icon: Icon(MyIcon.journal), label: "Journal"),
    BottomNavigationBarItem(icon: Icon(Icons.handyman), label: "Doa"),
    BottomNavigationBarItem(icon: Icon(Icons.inbox), label: "Pesan Ustad"),
    BottomNavigationBarItem(icon: Icon(Icons.more_horiz_rounded), label: "More"),
  ];
  // Item Count
  int _selectedItem = 0;
  // List Of Screen
  List<Widget> _screen = [
    JournalScreen(),
    DoaScreen(),
    PesanUstadScreen(),
    MoreScreen()
  ];

  // Function
  void _onTapItem(int value) {
    setState(() {
      _selectedItem = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screen[_selectedItem],
      bottomNavigationBar: BottomNavigationBar(
        showUnselectedLabels: true,
        showSelectedLabels: true,
        selectedItemColor: kPrimaryColor,
        unselectedItemColor: Colors.grey,
        unselectedLabelStyle: GoogleFonts.poppins(color: Colors.grey),
        items: _botNavItem,
        currentIndex: _selectedItem,
        onTap: _onTapItem,
      ),
    );
  }
}
