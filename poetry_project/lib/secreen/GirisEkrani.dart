import 'package:flutter/material.dart';
import 'package:poetry_project/W%C4%B0dget/SiirGiris.dart';
import 'package:poetry_project/component/DrawerMenu.dart';
import 'package:poetry_project/component/PageWiev.dart';
import '../dataAccess/SiirlerDao.dart';
import '../models/Siir.dart';

class Giris extends StatefulWidget {
  const Giris({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _GirisState();
  }
}

class _GirisState extends State {
  @override
  final PageController _pageController =
      PageController(initialPage: 0, keepPage: false);

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return (Scaffold(
      appBar: AppBar(
        title: Text("ASİİRLOG"),
        backgroundColor: Colors.purple,
      ),
      drawer: Drawer(child: DrawerMenu()),
      body: SiirGiris(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print("müzik eklenecek");
        },
        tooltip: "müzik",
        child: Icon(Icons.audiotrack),
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.pinkAccent,
      ),
    ));
  }
}
