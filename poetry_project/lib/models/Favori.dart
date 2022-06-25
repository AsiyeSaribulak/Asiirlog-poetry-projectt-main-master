import 'package:flutter/material.dart';

class Favori extends ChangeNotifier {
  late int _id;
  late int _siir_id;
  late bool _begeni;

  Favori.withID(this._id, this._siir_id, bool begeni);
  Favori(this._siir_id, json, bool begeni);

  int get id => _id;
  int get siir_id => _siir_id;
  bool get begeni => _begeni;

  set begeni(bool begeni) {
    _begeni = begeni;
    notifyListeners();
  }

  Favori.cevirObje(dynamic o) {
    this._id = o['id'];
    this._siir_id = o['siir_id'];
    this._begeni = o['begeni'];
  }

  Map<String, dynamic> cevirMap() {
    var map = new Map<String, dynamic>();

    if (_id != null) {
      map['id'] = _id;
    }

    map['siir_id'] = _siir_id;
    map['begeni'] = _begeni;
    return map;
  }

  Favori.fromMap(Map<String, dynamic> map) {
    this._id = map['id'];
    this._siir_id = map['siir_id'];
    this._begeni = map['begeni'];
  }

  factory Favori.fromJson(Map<dynamic, dynamic> json) {
    return Favori(
        json['id'] as int, json['siir_id'] as int, json['begeni'] as bool);
  }
}
