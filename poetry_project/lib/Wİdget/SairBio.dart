import 'package:flutter/material.dart';
import 'package:poetry_project/models/Sair.dart';

class SairBio extends StatefulWidget {
  late Sair sair;
  SairBio({required this.sair});

  @override
  State<SairBio> createState() => _SairBioState();
}

class _SairBioState extends State<SairBio> {
  @override
  Widget build(BuildContext context) {
    var ekranBilgisi = MediaQuery.of(context);
    final double ekranYuksekligi = ekranBilgisi.size.height;
    final double ekranGenisligi = ekranBilgisi.size.width;

    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            width: ekranGenisligi / 3,
            height: ekranGenisligi / 4,
            child: Image.asset(
              "assets/images/${widget.sair.slug}.jpg",
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: Text(
                  "${widget.sair.bio}",
                  style: TextStyle(fontSize: 14),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
