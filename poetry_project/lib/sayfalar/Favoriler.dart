import 'package:flutter/material.dart';

class Favoriler extends StatefulWidget {
  @override
  State<Favoriler> createState() => _FavorilerState();
}

class _FavorilerState extends State<Favoriler> {
  @override
  /* void initState() {
    var siir = widget.siir.baslik;
    super.initState();
  }*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('FAVORİLERİM'),
          backgroundColor: Colors.purple,
        ),
        body: Container(
          alignment: Alignment.center,
          child: Text(
            "favoriler sayfanız boş",
            style: TextStyle(color: Colors.grey.shade500),
          ),
        ));

    //  FavoriList(siir: widget.siir);
  }
}
