class SiirDepo {
  late int _id;
  late String _siir_baslik;
  late String _siir_icerik;

  SiirDepo.WithId(this._id, this._siir_baslik, this._siir_icerik);
  SiirDepo(this._siir_baslik, this._siir_icerik);

  int get id => _id;
  String get siir_baslik => _siir_baslik;
  String get siir_icerik => _siir_icerik;

  set siir_baslik(String baslik) {
    _siir_baslik = baslik;
  }

  set siir_icerik(String icerik) {
    _siir_icerik = icerik;
  }

  Map<String, dynamic> cevirMap() {
    var map = Map<String, dynamic>();
    if (_id != null) {
      map['id'] = _id;
    }
    map['siir_baslik'] = _siir_baslik;
    map['siir_icerik'] = _siir_icerik;
    return map;
  }

  SiirDepo.cevirObje(dynamic o) {
    this._id = o['id'];
    this._siir_baslik = o['_siir_baslik'];
    this._siir_icerik = o['_siir_icerik'];
  }

  SiirDepo.fromMap(Map<String, dynamic> map) {
    this._id = map['id'];
    this._siir_baslik = map['_siir_baslik'];
    this._siir_icerik = map['_siir_icerik'];
  }
}
