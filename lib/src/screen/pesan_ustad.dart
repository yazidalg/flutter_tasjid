import 'package:flutter/material.dart';
import 'package:flutter_tasjid/src/model/model_ustad.dart';
import 'package:flutter_tasjid/src/utils/constants.dart';
import 'package:google_fonts/google_fonts.dart';

class PesanUstadScreen extends StatefulWidget {
  @override
  _PesanUstadScreenState createState() => _PesanUstadScreenState();
}

class _PesanUstadScreenState extends State<PesanUstadScreen> {
  int _currentIndex = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _currentIndex = 0;
  }

  int counter = 0;
  IconData _iconData = Icons.favorite_border;
  bool isClick = true;
  var dataUstad = [
    ModelUstad(
        id: 0,
        nama: "Ustad Adi Hidayat",
        image: "images/image-1.png",
        desc:
            "Tutup lah aurat mu, karena rosul mengajarkan untuk menutup aurat mu"),
    ModelUstad(
        id: 1,
        nama: "Ustad Hannan Attaki",
        image: "images/image-1.png",
        desc:
            "Allah Maha Pengampun, jika kamu melakukan banyak maksiat, maka mohon ampun lah kepada Allah"),
    ModelUstad(
        id: 2,
        nama: "Ustad Abdul Somad",
        image: "images/image-1.png",
        desc: "Kemanapun engkau pergi, yakinlah Allah maha melihat"),
    ModelUstad(
        id: 3,
        nama: "Ustad Adi Hidayat",
        image: "images/image-1.png",
        desc:
            "Jikalau ingin melakukan sesuatu, lakukan lah karena Allah, dan sertakan Allah bersamanya"),
    ModelUstad(
        id: 4,
        nama: "Ustad Adi Hidayat",
        image: "images/image-1.png",
        desc:
            "Tutup lah aurat mu, karena rosul mengajarkan untuk menutup aurat mu")
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "Pesan Ustadz",
          style: GoogleFonts.poppins(
              fontWeight: FontWeight.w600, fontSize: 24, color: Colors.black),
        ),
      ),
      body: Container(
          child: ListView(
        children: <Widget>[
          for (var element in dataUstad)
            _card(element.nama, element.desc, element.image)
        ],
      )),
    );
  }

  Widget _card(String ustad, desc, images) {
    return Container(
      width: 343,
      height: 283,
      margin: EdgeInsets.fromLTRB(16, 12, 16, 16),
      child: Card(
        elevation: 6,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Column(
          children: <Widget>[
            ListTile(
              leading: ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: Image.asset(images),
              ),
              title: Text(
                ustad,
                style: GoogleFonts.poppins(fontWeight: FontWeight.w600),
              ),
            ),
            Divider(
              thickness: 1,
              endIndent: 12,
              indent: 12,
              height: 18,
            ),
            Container(
                margin: EdgeInsets.fromLTRB(16, 8, 16, 8),
                child: Text(
                  desc,
                  style: GoogleFonts.poppins(color: Colors.black),
                )),
            Divider(
              thickness: 1,
              endIndent: 12,
              indent: 12,
              height: 18,
            ),
            Row(
              children: <Widget>[
                Container(
                  width: 161,
                  height: 31,
                  margin: EdgeInsets.fromLTRB(12, 8, 16, 12),
                  child: FlatButton.icon(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5)),
                    color: kPrimaryColor.withOpacity(0.2),
                    onPressed: () {},
                    icon: Icon(
                      Icons.person,
                      color: kPrimaryColor,
                    ),
                    label: Text("10.000 jamaah",
                        style: GoogleFonts.poppins(
                          color: kPrimaryColor,
                        )),
                  ),
                ),
                Container(
                    width: 191,
                    height: 31,
                    child: FlatButton(
                      color: kPrimaryColor.withOpacity(0.2),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5)),
                      child: Text(
                        "10.000.000 sholawat",
                        style: GoogleFonts.poppins(color: kPrimaryColor),
                      ),
                      onPressed: () {},
                    ))
              ],
            ),
            Row(children: <Widget>[
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  height: 30,
                  width: 164,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: kPrimaryColor)),
                  margin: EdgeInsets.only(left: 12),
                  child: OutlineButton(
                      highlightColor: kPrimaryColor.withOpacity(0.1),
                      disabledBorderColor: kPrimaryColor,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5)),
                      child: Text(
                        "Masukan Journal",
                        style: GoogleFonts.poppins(
                            color: kPrimaryColor, fontWeight: FontWeight.w600),
                      ),
                      onPressed: () {}),
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: IconButton(
                  icon: Icon(
                    _iconData,
                    color: Colors.red,
                  ),
                  onPressed: () {
                    setState(() {
                      if (!isClick) {
                        _iconData = Icons.favorite;
                        isClick = true;
                        counter++;
                      } else {
                        _iconData = Icons.favorite_border;
                        isClick = false;
                        counter--;
                      }
                    });
                  },
                ),
              ),
              Align(child: !isClick ? Text("") : Text("$counter" + " Di Sukai"))
            ])
          ],
        ),
      ),
    );
  }
}
