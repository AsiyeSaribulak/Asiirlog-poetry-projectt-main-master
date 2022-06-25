import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:poetry_project/dataAccess/SairlerDao.dart';
import 'package:poetry_project/models/Sair.dart';

import '../models/SairDetay.dart';

class SairList extends StatefulWidget {
  SairList({Key? key}) : super(key: key);

  @override
  State<SairList> createState() => _SairListState();
}

class _SairListState extends State<SairList> {
  late bool aramaYapiliyorMu = false;
  late String aramaKelimesi = "";

  Future<List<Sair>> tumSairleriGoster() async {
    var sairListesi = await SairlerDao().tumSairler();
    return sairListesi;
  }

  Future<List<Sair>> aramaYap(String aramaKelimesi) async {
    var sairListesi = await SairlerDao().sairAra(aramaKelimesi);
    return sairListesi;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.purple,
          title: aramaYapiliyorMu
              ? TextField(
                  decoration: const InputDecoration(
                    hintText: "Aramak istediğiniz şairin adını girin:",
                    hintStyle: TextStyle(
                      color: Colors.black,
                      fontSize: 14.0,
                    ),
                  ),
                  onChanged: (aramaSonucu) {
                    print("Arama sonucu:$aramaSonucu");
                    setState(() {
                      aramaKelimesi = aramaSonucu;
                    });
                  },
                )
              : const Text("ŞAİRLER"),
          actions: [
            aramaYapiliyorMu
                ? IconButton(
                    icon: const Icon(Icons.cancel),
                    onPressed: () {
                      setState(() {
                        aramaYapiliyorMu = false;
                        aramaKelimesi = " ";
                      });
                    },
                  )
                : IconButton(
                    icon: const Icon(Icons.search),
                    onPressed: () {
                      setState(() {
                        aramaYapiliyorMu = true;
                      });
                    },
                  ),
          ],
        ),
        body: FutureBuilder<List<Sair>>(
            future: aramaYapiliyorMu
                ? aramaYap(aramaKelimesi)
                : tumSairleriGoster(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                var sairListesi = snapshot.data;

                return GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 3 / 3,
                  ),
                  itemCount: sairListesi!.length,
                  itemBuilder: (context, index) {
                    var sair = sairListesi[index];
                    return GestureDetector(
                      onTap: (() {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SairDetay(sair: sair)));
                      }),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Card(
                          child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                SairDetay(sair: sair)));
                                  },
                                  child: Image.asset(
                                    "assets/images/${sair.slug}.jpg",
                                    width: 150,
                                    height: 130,
                                  ),
                                ),
                                const Spacer(),
                                Text(
                                  sair.ad,
                                  style:
                                      GoogleFonts.roboto(color: Colors.purple),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                );
              } else {
                return Center();
              }
            }));
  }
}
