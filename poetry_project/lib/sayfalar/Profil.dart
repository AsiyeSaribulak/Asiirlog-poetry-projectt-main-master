import 'package:flutter/material.dart';

class Profil extends StatefulWidget {
  const Profil({Key? key}) : super(key: key);

  @override
  _ProfilState createState() => _ProfilState();
}

class _ProfilState extends State<Profil> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PROFİLİM'),
        backgroundColor: Colors.purple,
      ),
      body: Container(
        alignment: Alignment.center,
        child: Text(
          "Profil",
          style: TextStyle(color: Colors.grey.shade500),
        ),
      ),
    );
  }
}
