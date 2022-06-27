import '../models/SiirDepo.dart';

abstract class SiirDepoRepository {
  Future<List<SiirDepo>> tumSiirler();
  Future<void> siirEkle(String siir_baslik, String siir_icerik);
  Future<void> siirSil(int id);
  Future<void> siirGuncelle(int id, String siir_baslik, String siir_icerik);
}
