import 'package:poetry_project/models/Favori.dart';

abstract class FavoriDurum {
  FavoriDurum();
}

class FavorilerYukleniyor extends FavoriDurum {
  FavorilerYukleniyor();
}

class FavorilerYuklendi extends FavoriDurum {
  List<Favori> favoriListesi;
  FavorilerYuklendi(this.favoriListesi);
}

class FavorilerBaslangicDurumu extends FavoriDurum {
  FavorilerBaslangicDurumu();
}

class FavorilerHata extends FavoriDurum {
  late String hataMesaji;
  FavorilerHata(this.hataMesaji);
}
