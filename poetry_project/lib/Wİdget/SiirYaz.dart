import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:poetry_project/dataAccess/SiirDepoDao.dart';
import 'package:poetry_project/sayfalar/SiirDepoSayfa.dart';

class SiirYaz extends StatefulWidget {
  const SiirYaz({Key? key}) : super(key: key);

  @override
  State<SiirYaz> createState() => _SiirYazState();
}

class _SiirYazState extends State<SiirYaz> {
  var tfSiirBaslik = TextEditingController();
  var tfSiirIcerik = TextEditingController();

  Future<void> ekle(String siir_baslik, String siir_icerik) async {
    await SiirDepoDao().siirEkle(siir_baslik, siir_icerik);
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => SiirDepoSayfa()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.purple,
          title: Text(
            "ŞİİR YAZ",
            style: GoogleFonts.novaSquare(fontSize: 20),
          )),
      body: Center(
          child: Padding(
        padding: const EdgeInsets.only(left: 50, right: 50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            TextField(
              controller: tfSiirBaslik,
              decoration: const InputDecoration(hintText: "şiirin Adı Ne?"),
            ),
            TextField(
              controller: tfSiirIcerik,
              decoration: const InputDecoration(hintText: "şiir içeriği"),
            ),
          ],
        ),
      )),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          ekle(tfSiirBaslik.text, tfSiirIcerik.text);
          Navigator.pop(context);
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => SiirDepoSayfa()));
        },
        tooltip: 'Şiir Yaz',
        icon: Icon(
          Icons.save,
        ),
        label: Text("Kaydet"),
      ),
    );
  }
}
