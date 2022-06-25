import 'package:flutter/material.dart';

class Sair with ChangeNotifier {
  late int _id;
  late String _ad;
  late String _slug;
  late int _siirSayisi;
  late String _bio;

  Sair(this._ad, this._slug, this._siirSayisi, this._bio);
  Sair.WithId(this._id, this._ad, this._slug, this._siirSayisi, this._bio);

  Sair.cevirObje(dynamic o) {
    this._id = o['id'];
    this._ad = o['ad'];
    this._slug = o['slug'];
    this._siirSayisi = o['siirSayisi'];
    this._bio = o['bio'];
  }
  int get id => _id;
  String get ad => _ad;
  String get slug => _slug;
  int get siirSayisi => _siirSayisi;
  String get bio => _bio;

  Map<String, dynamic> CevirMap() {
    var map = new Map<String, dynamic>();
    /* if (_id != null) {
      map['id'] = _id;
    }*/
    map['id'] = _id;
    map['ad'] = _ad;
    map['slug'] = _slug;
    map['siirSayisi'] = _siirSayisi;
    map['bio'] = _bio;
    return map;
  }

  Sair.fromMap(Map<String, dynamic> map) {
    this._id = map['id'];
    this._ad = map['ad'];
    this._slug = map['slug'];
    this._siirSayisi = map['siirSayisi'];
    this._bio = map['bio'];
  }
}
