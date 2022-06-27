import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:poetry_project/models/SiirDepo.dart';
import 'package:poetry_project/sayfalar/SiirDepoSayfa.dart';
import '../Cubit/SiirDepoCubit.dart';

class SiirDepoDetay extends StatefulWidget {
  late SiirDepo siirDepo;
  SiirDepoDetay({required this.siirDepo});

  @override
  State<SiirDepoDetay> createState() => _SiirDepoDetayState();
}

class _SiirDepoDetayState extends State<SiirDepoDetay> {
  var tfSiirBaslik = TextEditingController();
  var tfSiirIcerik = TextEditingController();

  Size TamEkran(BuildContext context) {
    debugPrint('Size = ' + MediaQuery.of(context).size.toString());
    return MediaQuery.of(context).size;
  }

  double Yukseklik(BuildContext context) {
    debugPrint('Yukseklik = ' + TamEkran(context).height.toString());
    return TamEkran(context).height;
  }

  double Genislik(BuildContext context) {
    debugPrint('Genislik = ' + TamEkran(context).width.toString());
    return TamEkran(context).width;
  }

  @override
  void initState() {
    super.initState();
    var siirDepo = widget.siirDepo;
    tfSiirBaslik.text = siirDepo.siir_baslik;
    tfSiirIcerik.text = siirDepo.siir_icerik;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.purple,
          title: Text(
            "ŞİİR DETAY",
            style: GoogleFonts.novaSquare(fontSize: 20),
          )),
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            color: Colors.purple.withOpacity(0.5),
          ),
          height: Yukseklik(context),
          child: IntrinsicHeight(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding:
                      const EdgeInsets.only(left: 25.0, right: 25.0, top: 18.0),
                  child: Expanded(
                    child: Container(
                      height: Yukseklik(context) * 0.10,
                      width: Genislik(context) * 0.02,
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(1),
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                          image: AssetImage("assets/images/feather1.png"),
                          fit: BoxFit.scaleDown,
                          colorFilter: ColorFilter.mode(
                              Colors.white.withOpacity(0.2), BlendMode.dstATop),
                        ),
                      ),
                      child: TextField(
                        maxLines: null,
                        expands: true,
                        controller: tfSiirBaslik,
                        decoration: InputDecoration(
                          hintText: "şiirin Adı Ne?",
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                color: Color.fromARGB(31, 53, 41, 41),
                                style: BorderStyle.solid,
                              )),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Expanded(
                    child: Container(
                      height: Yukseklik(context) * 0.7,
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(1),
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                          image: AssetImage("assets/images/cicekKitapPng.png"),
                          fit: BoxFit.scaleDown,
                          colorFilter: ColorFilter.mode(
                              Colors.white.withOpacity(0.2), BlendMode.dstATop),
                        ),
                      ),
                      child: ConstrainedBox(
                        constraints:
                            BoxConstraints(maxHeight: Yukseklik(context) * 0.6),
                        child: TextField(
                          maxLines: null,
                          expands: true,
                          controller: tfSiirIcerik,
                          decoration: InputDecoration(
                            hintText: "şiir içeriği",
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(
                                  color: Color.fromARGB(31, 53, 41, 41),
                                  style: BorderStyle.solid,
                                )),
                            errorMaxLines: null,
                            enabled: true,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Colors.purple,
        hoverColor: Colors.blue,
        highlightElevation: 60,
        onPressed: () {
          BlocProvider.of<SiirDepoCubit>(context).SiirDepoGuncelle(
              widget.siirDepo.id, tfSiirBaslik.text, tfSiirIcerik.text);
          Navigator.pop(context);
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => SiirDepoSayfa()));
        },
        tooltip: 'Şiir güncelle',
        icon: Icon(
          Icons.save,
        ),
        label: Text("Güncelle"),
      ),
    );
  }
}
