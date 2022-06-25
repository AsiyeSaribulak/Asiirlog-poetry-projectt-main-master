import 'package:flutter/material.dart';
import 'package:poetry_project/W%C4%B0dget/SairBio.dart';
import 'package:poetry_project/W%C4%B0dget/SiirList.dart';
import 'package:poetry_project/dataAccess/SairlerDao.dart';
import 'Sair.dart';

class SairDetay extends StatefulWidget {
  late Sair sair;
  SairDetay({required this.sair});
  @override
  State<SairDetay> createState() => _SairDetayState();
}

class _SairDetayState extends State<SairDetay> {
  Future<Sair> sairBiografi() async {
    var sairListesi = await SairlerDao().sairBioGetir(widget.sair.id);
    return sairListesi as Sair;
  }

  @override
  void initState() {
    var sair = widget.sair.bio;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.purple,
          title: Text("${widget.sair.ad} Hakkında"),
          bottom: const TabBar(
            tabs: [
              Tab(
                text: "hakkında",
              ),
              Tab(
                text: "şiirleri",
              ),
            ],
            indicatorColor: Colors.white,
          ),
        ),
        body: TabBarView(
          children: [
            SairBio(sair: widget.sair),
            SiirList(
              sair: widget.sair,
            ),
          ],
        ),
      ),
    );
  }
}
