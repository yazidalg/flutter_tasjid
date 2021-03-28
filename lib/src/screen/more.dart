import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MoreScreen extends StatefulWidget {
  @override
  _MoreScreenState createState() => _MoreScreenState();
}

class _MoreScreenState extends State<MoreScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF8F8F8),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color(0xffF8F8F8),
        centerTitle: false,
        title: Text(
          "More",
          style: GoogleFonts.poppins(
              fontWeight: FontWeight.w600, color: Colors.black, fontSize: 24),
        ),
      ),
      body: Container(
        margin: EdgeInsets.only(left: 16, right: 16),
        child: Column(
          children: <Widget>[
            _listTile('Referensi Ustad', () {
              Navigator.pushNamed(context, '/referensiUst');
            }),
            _listTile('Referensi Doa', () {
              Navigator.pushNamed(context, '/referensiDoa');
            }),
            _listTile('Daftar Dzikir', () {
              Navigator.pushNamed(context, '/daftarDzikir');
            }),
            _listTile('Jadwal', () {}),
          ],
        ),
      ),
    );
  }

  Widget _listTile(String title, Function ontap) {
    return GestureDetector(
      child: Container(
        margin: EdgeInsets.only(top: 16, bottom: 16),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
        child: ListTile(
            tileColor: Colors.white,
            title: Text(title,
                style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w500, color: Colors.black)),
            trailing: IconButton(
              icon: Icon(
                Icons.arrow_forward_ios,
                color: Colors.black,
              ),
              onPressed: () {},
            )),
      ),
      onTap: ontap,
    );
  }
}
