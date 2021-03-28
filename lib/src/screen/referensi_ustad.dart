import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ReferensiUstadScreen extends StatefulWidget {
  @override
  _ReferensiUstadScreenState createState() => _ReferensiUstadScreenState();
}

class _ReferensiUstadScreenState extends State<ReferensiUstadScreen> {
  IconData check = Icons.check_box_outline_blank;
  bool _isFilled = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          "Referensi Ustad",
          style: GoogleFonts.poppins(
              fontWeight: FontWeight.w600, color: Colors.black),
        ),
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
          child: ListView.builder(
              itemCount: 5,
              itemBuilder: (context, index) {
                return _card("Ustad Yusuf Mansur",
                    "Feugiat euismod dolor lobortis id vitae risus gravida sit. Gravida adipiscing dignissim neque egestas. Diam tortor turpis mi, mi lacinia mi. Enim, nunc, leo id ipsum eu eu aliquam tincidunt. Orci in et amet purus arcu nisl turpis suscipit netus.");
              })),
    );
  }

  Widget _card(String ustad, doaName) {
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
              leading: CircleAvatar(
                child: Image.asset('images/image-1.png'),
              ),
              title: Text(
                ustad,
                style: GoogleFonts.poppins(fontWeight: FontWeight.w600),
              ),
              trailing: IconButton(
                icon: Icon(check),
                onPressed: () {
                  setState(() {
                    if (!_isFilled) {
                      check = Icons.check_box_outline_blank;
                      _isFilled = true;
                    } else {
                      check = Icons.check_box;
                      _isFilled = false;
                    }
                  });
                },
              ),
            ),
            Divider(
              thickness: 1,
              endIndent: 12,
              indent: 12,
              height: 18,
            ),
            Container(
              margin: EdgeInsets.fromLTRB(16, 16, 16, 8),
              alignment: Alignment.centerLeft,
              child: Text(
                doaName,
                style: GoogleFonts.poppins(color: Colors.black),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
