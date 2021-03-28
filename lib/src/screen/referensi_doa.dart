import 'package:flutter/material.dart';
import 'package:flutter_tasjid/src/utils/constants.dart';
import 'package:google_fonts/google_fonts.dart';

class ReferensiDoaScreen extends StatefulWidget {
  @override
  _ReferensiDoaScreenState createState() => _ReferensiDoaScreenState();
}

class _ReferensiDoaScreenState extends State<ReferensiDoaScreen> {
  IconData _check = Icons.check_box_outline_blank;
  bool _isFilled = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffF8F8F8),
        title: Text("Referensi Doa",
            style: GoogleFonts.poppins(
                fontWeight: FontWeight.w600, color: Colors.black)),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Container(
        child: ListView.builder(itemBuilder: (context, index) {
          return _card(
              'ustad Adi Hidayat',
              'Doa Mau Makan',
              'ِراَّنلا َباَذَع اَنِقَو اَنَتْقَزَر اَميِف اَنَل ْكِراَب َّمُهَّللا',
              'Alloohumma baariklanaa fiimaa rozaqtanaa wa qinaa ‘adzaaban naar');
        }),
      ),
    );
  }

  Widget _card(String ustad, doaName, doa, indonesiaDoa) {
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
              leading: CircleAvatar(),
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
                )),
            Container(
              alignment: Alignment.bottomRight,
              child: FlatButton.icon(
                  onPressed: () {
                    setState(() {
                      if (!_isFilled) {
                        _check = Icons.check_box_outline_blank;
                        _isFilled = true;
                      } else {
                        _check = Icons.check_box;
                        _isFilled = false;
                      }
                    });
                  },
                  icon: Icon(
                    _check,
                    color: kPrimaryColor,
                  ),
                  label: Text(
                    "Tambah Doa",
                    style: GoogleFonts.poppins(fontWeight: FontWeight.w600),
                  )),
            )
          ],
        ),
      ),
    );
  }
}
