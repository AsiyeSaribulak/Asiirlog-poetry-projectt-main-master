import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:poetry_project/W%C4%B0dget/SiirGoster.dart';
import 'package:poetry_project/dataAccess/SiirlerDao.dart';

import '../models/Sair.dart';
import '../models/Siir.dart';

class SiirList extends StatefulWidget {
  late Sair sair;
  SiirList({required this.sair});

  @override
  State<SiirList> createState() => _SiirListState();
}

class _SiirListState extends State<SiirList> {
  late bool aramaYapiliyorMu = false;
  late String aramaKelimesi = "";
  late bool begendi = false;
  late Siir siir;

  Future<List<Siir>> siirGoster(int sairId) async {
    var siirListesi = await SiirlerDao().tumSiirlerBySairId(sairId);
    return siirListesi;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<Siir>>(
          future: siirGoster(widget.sair.id),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              var siirListesi = snapshot.data;
              return ListView.builder(
                itemCount: siirListesi!.length,
                itemBuilder: (context, indeks) {
                  var siir = siirListesi[indeks];
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SiirGoster(
                                    siir: siir,
                                  )));
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Card(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(
                                width: 80,
                                height: 100,
                                child: Image.asset(
                                    "assets/images/${widget.sair.slug}.jpg")),
                            Spacer(),
                            Text(
                              siir.baslik,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 11,
                              ),
                            ),
                            Spacer(),
                            IconButton(
                              icon: Icon(
                                Icons.keyboard_arrow_right,
                                color: Colors.purple,
                              ),
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => SiirGoster(
                                              siir: siir,
                                            )));
                                setState(() {
                                  if (begendi = true) {
                                    color:
                                    Colors.red;
                                  }
                                });
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              );
            } else {
              return Center(
                child: Text("${widget.sair.id}"),
              );
            }
          }),
    );
  }
}
