import 'package:flutter/material.dart';
import 'package:poetry_project/models/Sair.dart';

class Siir with ChangeNotifier {
  late final int _id;
  late final String _baslik;
  late final String _icerik;
  late final int _sair_id;
  late final int _is_favorite;
  late final String ad;
  late final String _slug;

  Siir(this._id,this._baslik, this._icerik, this._sair_id, this._is_favorite, this.ad,
      this._slug);
  Siir.WithId(this._id, this._baslik, this._icerik, this._sair_id,
      this._is_favorite, this.ad, this._slug, Sair sairTablo);

  Siir.cevirObje(dynamic o) {
    this._id = o['id'];
    this._baslik = o['baslik'];
    this._icerik = o['icerik'];
    this._sair_id = o['sair_id'];
    this.ad = o['ad'];
    this._slug = o['slug'];
    this._is_favorite = o['is_favorite'];
  }
  int get id => _id;
  String get baslik => _baslik;
  String get icerik => _icerik;
  int get sair_id => _sair_id;
  bool get isFavorite => _is_favorite == 1 ? true : false;
  String get sairAd => ad;
  String get sairSlug => _slug;

  set isFavorite(bool isFavorite) {
    _is_favorite = isFavorite ? 1 : 0;
    notifyListeners();
  }

  set icerik(String icerik) {
    _icerik = icerik;
    notifyListeners();
  }

  set sair_id(int val) {
    _sair_id = val;
    notifyListeners();
  }

  set sairAd(String val) {
    ad = val;
    notifyListeners();
  }

  set sairSlug(String val) {
    _slug = val;
    notifyListeners();
  }

  Map<String, dynamic> CevirpMap() {
    var map = Map<String, dynamic>();
    /* if (_id != null) {
      map['id'] = _id;
    }*/
    map['id'] = _id;
    map['baslik'] = _baslik;
    map['icerik'] = _icerik;
    map['sair_id'] = _sair_id;
    map['is_favorite'] = _is_favorite;
    map['slug'] = _slug;
    map['ad'] = ad;
    return map;
  }

  Siir.fromMap(Map<String, dynamic> map) {
    this._id = map['id'];
    this._baslik = map['baslik'];
    this._icerik = map['icerik'];
    this._sair_id = map['sair_id'];
    this._is_favorite = map['is_favorite'];
    this.ad = map['ad'];
    this._slug = map['slug'];
  }

  static List<int> cevirList(List<Map<String, dynamic>> siirList) {
    List<int> ids = List<int>.filled(siirList.length, 0, growable: false);
    for (var i = 0; i < siirList.length; i++) {
      ids.add(Siir.fromMap(siirList[i]).id);
    }
    return ids;
  }
}
