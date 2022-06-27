import '../models/Siir.dart';

abstract class SiirDurum {
  SiirDurum();
}

class SiirlerYukleniyor extends SiirDurum {
  SiirlerYukleniyor();
}

class SiirlerYuklendi extends SiirDurum {
  List<Siir> siirListesi;
  SiirlerYuklendi(this.siirListesi);
}

class SiirBaslangicDurumu extends SiirDurum {
  SiirBaslangicDurumu();
}

class SiirHata extends SiirDurum {
  late String hataMesaji;
  SiirHata(this.hataMesaji);
}
