import 'package:poetry_project/models/SiirDepo.dart';

abstract class SiirDepoDurum {
  SiirDepoDurum();
}

class SiirDepoYukleniyor extends SiirDepoDurum {
  SiirDepoYukleniyor();
}

class SiirDepoYuklendi extends SiirDepoDurum {
  List<SiirDepo> siirDepoListesi;
  SiirDepoYuklendi(this.siirDepoListesi);
}

class SiirDepoBaslangicDurumu extends SiirDepoDurum {
  SiirDepoBaslangicDurumu();
}

class SiirDepoHata extends SiirDepoDurum {
  late String hataMesaji;
  SiirDepoHata(this.hataMesaji);
}
