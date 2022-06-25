class Ayarlar {
  late int _tema;
  late int _fontSize;
  late int _showAds;
  late int _sendDaily;

  Ayarlar(this._tema, this._fontSize, this._showAds, this._sendDaily);

  Ayarlar.cevirObje(dynamic o) {
    this._tema = o['tema'];
    this._fontSize = o['font_size'];
    this._showAds = o['show_ads'];
    this._sendDaily = o['send_daily'];
  }

  int get tema => _tema;
  int get fontSize => _fontSize;
  int get showAds => _showAds;
  int get sendDaily => _sendDaily;

  Map<String, dynamic> CevirMap() {
    var map = new Map<String, dynamic>();
    map['tema'] = _tema;
    map['font_size'] = _fontSize;
    map['show_ads'] = _showAds;
    map['send_daily'] = _sendDaily;
    return map;
  }

  Ayarlar.fromMap(Map<String, dynamic> map) {
    this._tema = map['tema'];
    this._fontSize = map['font_size'];
    this._sendDaily = map['send_daily'];
    this._showAds = map['show_ads'];
  }
}
