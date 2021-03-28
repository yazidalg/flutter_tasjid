import 'package:flutter/material.dart';
import 'package:flutter_tasjid/src/utils/constants.dart';
import 'package:google_fonts/google_fonts.dart';

class DaftarDzikir extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(context),
      body: Container(
          child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          ListView.builder(
              itemCount: 2,
              itemBuilder: (context, index) {
                return _cardOfDzikir("سُبْحَانَ اللّهُ", "Subhanallah",
                    "Maha Suci Allah", "Takbir");
              }),
          Positioned(
            bottom: 80,
            right: 20,
            child: Container(
              child: FlatButton(
                onPressed: () {},
                color: kPrimaryColor,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                child: Text(
                  "Tambah Dzikir",
                  style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w600, color: Colors.white),
                ),
              ),
            ),
          )
        ],
      )),
    );
  }

  Widget _cardOfDzikir(String nameDoa, readInIndonesia, translate, type) {
    return Container(
      margin: EdgeInsets.fromLTRB(16, 30, 16, 0),
      width: double.infinity,
      height: 250,
      child: Card(
        shadowColor: Colors.black38,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        elevation: 4,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ListTile(
              title: Text(
                type,
                style: GoogleFonts.poppins(fontWeight: FontWeight.w600),
              ),
              trailing: TextButton(
                child: Text("Lihat Detail",
                    style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w400, color: kPrimaryColor)),
                onPressed: () {},
              ),
            ),
            Divider(endIndent: 12, indent: 12, color: Colors.grey),
            Text(
              nameDoa,
              style: GoogleFonts.scheherazade(fontSize: 30),
            ),
            Text(readInIndonesia,
                style: GoogleFonts.poppins(fontStyle: FontStyle.italic)),
            Divider(
              endIndent: 12,
              indent: 12,
              color: Colors.grey,
            ),
            Text(
              translate,
              style: GoogleFonts.poppins(fontSize: 15, color: Colors.black38),
            )
          ],
        ),
      ),
    );
  }

  Widget _appBar(BuildContext context) {
    return AppBar(
      backgroundColor: Color(0xffF8F8F8),
      title: Text("Daftar Dzikir",
          style: GoogleFonts.poppins(
              fontWeight: FontWeight.w600, fontSize: 22, color: Colors.black)),
      leading: IconButton(
        icon: Icon(
          Icons.arrow_back_ios,
          color: Colors.black,
        ),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    );
  }
}
