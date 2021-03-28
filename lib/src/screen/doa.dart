import 'package:flutter/material.dart';
import 'package:flutter_tasjid/src/model/model_doa.dart';
import 'package:google_fonts/google_fonts.dart';

class DoaScreen extends StatefulWidget {
  @override
  _DoaScreenState createState() => _DoaScreenState();
}

class _DoaScreenState extends State<DoaScreen> {
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _currentIndex = 0;
  }

  ModelDoa _doa = ModelDoa();

  var dataDoa = [
    ModelDoa(
        id: 0,
        image: "images/image-1.png",
        namaUstad: "Ustad Yusuf Mansur",
        doaName: "Doa Mau Makan",
        arabic:
        "ِراَّنلا َباَذَع اَنِقَو اَنَتْقَزَر اَميِف اَنَل ْكِراَب َّمُهَّللا",
        read: "Allahumma bariklana fima razak tana wakina azabannar"),
    ModelDoa(
        id: 0,
        image: "images/image-1.png",
        namaUstad: "Ustad Khidir",
        doaName: "Doa Mau Makan",
        arabic:
        "ِراَّنلا َباَذَع اَنِقَو اَنَتْقَزَر اَميِف اَنَل ْكِراَب َّمُهَّللا",
        read: "Allahumma bariklana fima razak tana wakina azabannar"),
    ModelDoa(
        id: 0,
        image: "images/image-1.png",
        namaUstad: "Ustad Mansur",
        doaName: "Doa Mau Tidur",
        arabic:
        "ِراَّنلا َباَذَع اَنِقَو اَنَتْقَزَر اَميِف اَنَل ْكِراَب َّمُهَّللا",
        read: "Allahumma bariklana fima razak tana wakina azabannar"),
    ModelDoa(
        id: 0,
        image: "images/image-1.png",
        namaUstad: "Ustad Yazid Al Ghozali",
        doaName: "Doa Mau Masuk Masjid",
        arabic:
        "ِراَّنلا َباَذَع اَنِقَو اَنَتْقَزَر اَميِف اَنَل ْكِراَب َّمُهَّللا",
        read: "Allahumma bariklana fima razak tana wakina azabannar"),
    ModelDoa(
        id: 0,
        image: "images/image-1.png",
        namaUstad: "Ustad Yusuf Mansur",
        doaName: "Doa Keluar Masjid",
        arabic:
        "ِراَّنلا َباَذَع اَنِقَو اَنَتْقَزَر اَميِف اَنَل ْكِراَب َّمُهَّللا",
        read: "Allahumma bariklana fima razak tana wakina azabannar")
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xffF8F8F8),
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text(
            "Doa",
            style: GoogleFonts.poppins(
                fontWeight: FontWeight.w600, fontSize: 24, color: Colors.black),
          ),
        ),
        body: Container(
            child: Stack(
              alignment: Alignment.bottomRight,
              children: <Widget>[
                ListView(
                  children: <Widget>[
                    for (var element in dataDoa)
                      _card(element.namaUstad, element.doaName, element.arabic,
                          element.read, element.image)
                  ],
                )
              ],
            )));
  }

  Widget _card(String ustad, doaName, doa, indonesiaDoa, images) {
    return Container(
      width: 343,
      height: 253,
      margin: EdgeInsets.fromLTRB(16, 12, 16, 16),
      child: Card(
        elevation: 6,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Column(
          children: <Widget>[
            ListTile(
              leading: ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: Image.asset(images),),
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
                margin: EdgeInsets.only(top: 16, bottom: 8),
                child: Text(
                  doaName,
                  style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w600, color: Colors.black),
                )),
            Text(
              doa,
              style: GoogleFonts.scheherazade(
                  fontWeight: FontWeight.w400,
                  fontSize: 26,
                  color: Colors.black),
            ),
            Container(
                margin: EdgeInsets.only(top: 8),
                width: 284,
                child: Text(
                  indonesiaDoa,
                  maxLines: 2,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                      fontSize: 14, fontStyle: FontStyle.italic),
                ))
          ],
        ),
      ),
    );
  }
}
