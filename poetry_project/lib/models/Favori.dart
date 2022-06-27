import 'package:flutter/material.dart';

class Favori {
  late int _id;
  late int _siir_id;
  late String _siir_baslik;
  late String _siir_icerik;
  late String _sair_ad;
  late String _sair_slug;

  Favori.withID(this._id, this._siir_id, this._siir_baslik, String _siir_icerik,
      String _sair_ad, String _sair_slug);
  Favori(this._siir_baslik, String _siir_icerik, String _sair_ad);

  int get id => _id;
  String get siir_baslik => _siir_baslik;
  String get siir_icerik => _siir_icerik;
  String get sair_ad => _sair_ad;
  int get siir_id => _siir_id;
  String get sair_slug => _sair_slug;

  Favori.cevirObje(dynamic o) {
    this._id = o['id'];
    this._siir_baslik = o['siir_baslik'];
    this._siir_icerik = o['siir_icerik'];
    this._sair_ad = o["sair_ad"];
    this._siir_id = o["siir_id"];
    this._sair_slug = o["sair_slug"];
  }

  Map<String, dynamic> cevirMap() {
    var map = new Map<String, dynamic>();

    if (_id != null) {
      map['id'] = _id;
    }

    map['siir_baslik'] = _siir_baslik;
    map['siir_icerik'] = _siir_icerik;
    map['sair_ad'] = _sair_ad;
    map['siir_id'] = _siir_id;
    map['sair_slug'] = _sair_slug;
    return map;
  }

  Favori.fromMap(Map<String, dynamic> map) {
    this._id = map['id'];
    this._siir_baslik = map['siir_id'];
    this._siir_icerik = map['siir_icerik'];
    this._sair_ad = map["sair_ad"];
    this._siir_id = map["siir_id"];
    this._sair_slug = map["sair_slug"];
  }
}
