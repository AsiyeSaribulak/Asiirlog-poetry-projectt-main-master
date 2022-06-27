import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:http/http.dart' as http;
import 'package:html/parser.dart' as parser;
import 'package:lottie/lottie.dart';

import '../models/SiirGetirModel.dart';
import 'SiirGetirDetay .dart';

class SiirGiris extends StatefulWidget {
  const SiirGiris({Key? key}) : super(key: key);

  @override
  State<SiirGiris> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<SiirGiris> {
  var url = Uri.parse("https://www.antoloji.com/siir/");
  var data;
  bool isloading = false;
  List<SiirModelGetir> siir = [];

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
  /*
resim=element
          .children[0].children[0].children[0].attributes['data-original']
          .toString()
şiir başlık=element.children[1].children[0].attributes['href'].toString()
şair=element.children[1].children[1].attributes['href'].toString()
şiir içerik=element.children[2].text
buton=element.children[3].children[1].attributes['href'].toString()
  */

  Future getData() async {
    setState(() {
      isloading = true;
    });
    var res = await http.get(url);
    final body = res.body;
    final document = parser.parse(body);
    var response = document
        .getElementsByClassName("row")[1]
        .getElementsByClassName("poem-detail-box box")
        .forEach((element) {
      setState(() {
        siir.add(SiirModelGetir(
          resim: element
              .children[0].children[0].children[0].attributes['data-original']
              .toString(),
          baslik: element.children[1].children[0].children[0].text.toString(),
          SairAd: element.children[1].children[1].text.toString(),
          icerik: element.children[2].text.toString(),
          buton: element.children[3].children[1].attributes['href'].toString(),
        ));
      });
    });
    setState(() {
      isloading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isloading
          ? Center(
              child: Lottie.asset("assets/loading2.json"),
            )
          : SafeArea(
              child: Container(
                color: Colors.purple.withOpacity(0.2),
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 1,
                    childAspectRatio: 0.7,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                  ),
                  itemCount: siir.length,
                  itemBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Color(0XFFFBD6D2),
                          borderRadius: BorderRadius.circular(25.0),
                          image: const DecorationImage(
                            image: AssetImage("assets/images/parsomenPng.png"),
                            fit: BoxFit.cover,
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          siir[index].baslik,
                                          style: TextStyle(
                                            color: Color(0XFFA63EC5),
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20,
                                          ),
                                        ),
                                        SizedBox(height: 5),
                                        Text(
                                          siir[index].SairAd,
                                          style: TextStyle(
                                              color:
                                                  Colors.black87.withOpacity(1),
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                    Spacer(),
                                    Stack(
                                      children: [
                                        ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            child: Image.network(
                                              siir[index].resim,
                                              alignment: Alignment.topLeft,
                                            )),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 0,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  siir[index].icerik,
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 15),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: TextButton(
                                    style: TextButton.styleFrom(
                                        shadowColor: Colors.blue,
                                        backgroundColor: Colors.white10),
                                    onPressed: (() {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  SiirGetirDetay()));
                                      setState(() {
                                        siir[index].buton;
                                        print(siir[index].buton);
                                      });
                                    }),
                                    child: Text(
                                      ">> Devamını Oku",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 15),
                                    )),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
    );
  }

  TextStyle _style = TextStyle(
    color: Colors.white,
    fontSize: 15,
  );
}
