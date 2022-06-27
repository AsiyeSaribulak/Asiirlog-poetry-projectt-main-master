import '../models/Favori.dart';

abstract class FavorilerRepository {
  Future<List<Favori>> tumFavoriler();

  Future<void> favoriEkleSql(int siir_id, String siir_baslik,
      String siir_icerik, String sair_ad, String sair_slug);

  Future<void> favoriSil(int siir_id);
}
