import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:poetry_project/Cubit/SiirDepoCubit.dart';
import 'package:poetry_project/dataAccess/SiirDepoDao.dart';
import 'package:poetry_project/sayfalar/SiirDepoDetay.dart';
import '../Wİdget/SiirDepoDurum.dart';
import '../Wİdget/SiirYaz.dart';
import '../models/SiirDepo.dart';

class SiirDepoSayfa extends StatefulWidget {
  const SiirDepoSayfa({Key? key}) : super(key: key);

  @override
  State<SiirDepoSayfa> createState() => _SiirDepoSayfaState();
}

class _SiirDepoSayfaState extends State<SiirDepoSayfa> {
  /* Future<List<SiirDepo>> yazdiginSiiriGoster() async {
    var siirDepoList = await SiirDepoDao().tumSiirler();
    return siirDepoList;
  }

  Future<void> sil(int siir_id) async {
    await SiirDepoDao().siirSil(siir_id);
    setState(() {});
  }*/

  @override
  void initState() {
    super.initState();
    context.read<SiirDepoCubit>().SiirDepoAl();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink.shade50,
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: Text(
          "ŞİİRLERİM",
          textAlign: TextAlign.center,
          style: GoogleFonts.novaSquare(fontSize: 20),
        ),
      ),
      body: BlocBuilder<SiirDepoCubit, SiirDepoDurum>(
        builder: (context, siirDepoDurum) {
          if (siirDepoDurum is SiirDepoYuklendi) {
            var siirDepoList = siirDepoDurum.siirDepoListesi;

            return ListView.builder(
              itemCount: siirDepoList.length,
              itemBuilder: (context, indeks) {
                var siirDepo = siirDepoList[indeks];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SiirDepoDetay(
                                  siirDepo: siirDepo,
                                )));
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: SizedBox(
                      width: 100,
                      height: 70,
                      child: Column(
                        children: [
                          Card(
                            elevation: 8,
                            shape: BeveledRectangleBorder(
                                borderRadius: BorderRadius.circular(15)),
                            color: Color.fromARGB(157, 252, 181, 246),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text(
                                  siirDepo.siir_baslik,
                                  style: GoogleFonts.novaSquare(
                                      fontWeight: FontWeight.bold),
                                ),
                                IconButton(
                                  icon: Icon(
                                    Icons.delete,
                                    color: Colors.black54,
                                  ),
                                  onPressed: () {
                                    context
                                        .read<SiirDepoCubit>()
                                        .SiirDepoSil(siirDepo.id);
                                  },
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          } else {
            return Center();
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print("şiir yazıldı");
          Navigator.pop(context);
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => SiirYaz()));
        },
        tooltip: "siir",
        child: const Icon(Icons.add),
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.pinkAccent,
      ),
    );
  }
}
