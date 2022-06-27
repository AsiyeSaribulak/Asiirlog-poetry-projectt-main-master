import '../models/Favori.dart';
import '../models/Siir.dart';

abstract class SiirlerRepository {
  Future<List<Siir>> tumSiirlerBySairId(int sairId);
  Future<List<Siir>> randomSiir(int siirId);
  Future<List<Siir>> tumSiirler();
  Future<List<Favori>> tumFavoriler();
  Future<void> favoriEkleSql(int siir_id, String siir_baslik,
      String siir_icerik, String sair_ad, String sair_slug);
  Future<void> favoriSil(int siir_id);
}
