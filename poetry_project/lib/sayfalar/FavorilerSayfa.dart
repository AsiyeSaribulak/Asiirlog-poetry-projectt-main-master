import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:poetry_project/Cubit/FavoriCubit.dart';
import 'package:poetry_project/W%C4%B0dget/FavoriDurum.dart';

import '../models/Siir.dart';

class FavorilerSayfa extends StatefulWidget {
  late final Siir siir;
  @override
  State<FavorilerSayfa> createState() => _FavorilerSayfaState();
}

class _FavorilerSayfaState extends State<FavorilerSayfa> {
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
    context.read<FavoriCubit>().FavoriAl();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FAVORİLERİM'),
        backgroundColor: Colors.purple,
      ),
      body: BlocBuilder<FavoriCubit, FavoriDurum>(
          builder: (context, favoriDurum) {
        if (favoriDurum is FavorilerYuklendi) {
          var favoriListesi = favoriDurum.favoriListesi;
          return GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 3 / 3,
            ),
            itemCount: favoriListesi.length,
            itemBuilder: (context, index) {
              var favori = favoriListesi[index];
              return Container(
                child: Column(
                  children: [
                    IntrinsicHeight(
                      child: Card(
                        elevation: 8,
                        child: Column(
                          children: [
                            Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Expanded(
                                  child: Container(
                                      height: Yukseklik(context) * 0.10,
                                      width: Genislik(context) * 0.02,
                                      child: Text(widget.siir.baslik)),
                                )),
                            Spacer(),
                            Expanded(
                              child: Container(
                                  color: Colors.black,
                                  height: Yukseklik(context) * 0.10,
                                  width: Genislik(context) * 0.02,
                                  child: Text(widget.siir.icerik)),
                            ),
                            Expanded(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Container(
                                      height: Yukseklik(context) * 0.10,
                                      width: Genislik(context) * 0.02,
                                      child: Text(widget.siir.sairAd)),
                                  Image.asset(
                                      "assets/image/${widget.siir.sairSlug}.jpg"),
                                  IconButton(
                                      onPressed: () {
                                        context
                                            .read<FavoriCubit>()
                                            .FavoriSil(favori.id);
                                      },
                                      icon: Icon(Icons.favorite)),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        } else {
          return Center();
        }
      }),
    );
  }
}
/*var favori = favoriListesi[index];

              Column(
                children: [
                  IntrinsicHeight(
                    child: Card(
                      elevation: 8,
                      child: Column(
                        children: [
                          Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Expanded(
                                child: Container(
                                    height: Yukseklik(context) * 0.10,
                                    width: Genislik(context) * 0.02,
                                    child: Text(widget.siir.baslik)),
                              )),
                          Spacer(),
                          Expanded(
                            child: Container(
                                height: Yukseklik(context) * 0.10,
                                width: Genislik(context) * 0.02,
                                child: Text(widget.siir.icerik)),
                          ),
                          Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Container(
                                    height: Yukseklik(context) * 0.10,
                                    width: Genislik(context) * 0.02,
                                    child: Text(widget.siir.sairAd)),
                                Image.asset("assets/image/${widget.siir.sairSlug}.jpg"),
                             IconButton(
                              onPressed:(){
                                context.read<FavoriCubit>().FavoriSil(favori.id);
                              } , 
                              icon: Icon(Icons.favorite)
                              ),

                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ); */