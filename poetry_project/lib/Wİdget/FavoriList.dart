import 'package:flutter/material.dart';
import 'package:poetry_project/W%C4%B0dget/SiirGoster.dart';
import 'package:poetry_project/dataAccess/FavorilerDao.dart';
import '../models/Favori.dart';
import '../models/Siir.dart';

class FavoriList extends StatefulWidget {
  late Siir siir;
  FavoriList({required this.siir});

  @override
  State<FavoriList> createState() => _FavoriListState();
}

class _FavoriListState extends State<FavoriList> {
  Future<List<Favori>> favoriGetir() async {
    var favoriListesi = FavorilerDao().tumFavoriler();
    return favoriListesi;
  }

  Future<void> favorilerdenKaldir(int siir_id) async {
    FavorilerDao().favoriSil(siir_id);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          AppBar(backgroundColor: Colors.purple, title: Text("FAVORİLERİM")),
      body: FutureBuilder<List<Favori>>(
          future: favoriGetir(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              var favoriListesi = snapshot.data;
              return ListView.builder(
                  itemCount: favoriListesi!.length,
                  itemBuilder: (context, indeks) {
                    var favori = favoriListesi[indeks];
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: ((context) => SiirGoster(
                                      siir: widget.siir,
                                    ))));
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Card(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                widget.siir.baslik,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 11,
                                ),
                              ),
                              IconButton(
                                icon: Icon(
                                  Icons.delete,
                                  color: Colors.purple,
                                ),
                                onPressed: () {
                                  favorilerdenKaldir(widget.siir.id);
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  });
            } else {
              return Center();
            }
          }),
    );
  }
}
