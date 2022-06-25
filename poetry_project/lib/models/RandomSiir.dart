import 'package:flutter/material.dart';

class RandomSiir extends ChangeNotifier {
  late int id;
  late String baslik;
  late String icerik;
  late String sair;
  RandomSiir(this.id, this.baslik, this.icerik, this.sair);
}
